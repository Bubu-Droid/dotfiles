#!/usr/bin/env python3

# Script by Evan which has been further modified
# by Bubu. This adds a few more macros and features
# and returns the converted code into the clipboard.

# Evan's script can be found at
# https://github.com/vEnhance/dotfiles/blob/main/py-scripts/export-ggb-clean-asy.py

# Bubu's script can be found at
# https://github.com/Bubu-Droid/dotfiles/blob/main/bon/aops.py

import re

import pyperclip

op_macros = {
    "\\floor": (" \\left\\lfloor ", " \\right\\rfloor "),
    "\\ceil": (" \\left\\lceil ", " \\right\\rceil "),
    "\\abs": (" \\left\\lvert ", " \\right\\lvert "),
    "\\norm": (" \\left\\lVert ", " \\right\\lVert "),
    "\\anbr": (" \\left\\langle ", " \\right\\rangle "),
    "\\sbr": (" \\left[ ", " \\right] "),
}

derv_macros = {
    "\\dd": "\\mathrm{d} ",
    "\\pd": "\\partial ",
}


def bracket_cpos(text: str, brac: tuple, pos: int) -> int:
    close_counter = 1
    open_counter = 0
    charpos = pos + 1

    for i in text[pos + 1 :]:
        if i == brac[0]:
            close_counter += 1
        elif i == brac[1]:
            open_counter += 1
        if close_counter == open_counter:
            break
        charpos += 1

    return charpos


def demacro_3(text: str) -> str:
    for key, value in derv_macros.items():
        while text.find(key) != -1:
            pos = text.find(key)
            if text[pos + len(key)] == "{":
                first_cur_cpos = bracket_cpos(text, ("{", "}"), pos + len(key))
                second_cur_cpos = bracket_cpos(text, ("{", "}"), first_cur_cpos + 1)

                inner_text_1 = text[pos + len(key) + 1 : first_cur_cpos]
                inner_text_2 = text[first_cur_cpos + 2 : second_cur_cpos]

                text = (
                    text[:pos]
                    + f"\\frac{{{value} {inner_text_1}}}{{{value} {inner_text_2}}}"
                    + text[second_cur_cpos + 1 :]
                )
            elif text[pos + len(key)] == "[":
                sq_opos = pos + len(key)
                sq_cpos = bracket_cpos(text, ("[", "]"), pos + len(key))
                first_cur_cpos = bracket_cpos(text, ("{", "}"), sq_cpos + 1)
                second_cur_cpos = bracket_cpos(text, ("{", "}"), first_cur_cpos + 1)

                func_deg = text[sq_opos + 1 : sq_cpos]
                inner_text_1 = text[sq_cpos + 2 : first_cur_cpos]
                inner_text_2 = text[first_cur_cpos + 2 : second_cur_cpos]

                text = (
                    text[:pos]
                    + f"\\frac{{{value}^{{{func_deg}}} {inner_text_1}}}{{{value} {inner_text_2}^{{{func_deg}}}}}"
                    + text[second_cur_cpos + 1 :]
                )

    return text


def demacro_2(text: str) -> str:
    for key, value in op_macros.items():
        while text.find(key) != -1:
            pos = text.find(key)
            first_cur_cpos = bracket_cpos(text, ("{", "}"), pos + len(key))

            inner_text_1 = text[pos + len(key) + 1 : first_cur_cpos]

            text = (
                text[:pos]
                + value[0]
                + inner_text_1
                + value[1]
                + text[first_cur_cpos + 1 :]
            )

    return text


# def demacro_2(text: str) -> str:


def demacro_1(text: str) -> str:
    replacements: list[tuple[str, str]] = [
        (r"\csc", r"\operatorname{cosec}"),
        (r"\arccsc", r"\operatorname{arccsc}"),
        (r"\arcsec", r"\operatorname{arcsec}"),
        (r"\arccot", r"\operatorname{arccot}"),
        (r"\ol", r"\overline"),
        (r"\ul", r"\underline"),
        (r"\wt", r"\widetilde"),
        (r"\wh", r"\widehat"),
        (r"\eps", r"\varepsilon"),
        (r"\tri", r"\triangle"),
        (r"\para", r"\parallel"),
        (r"\arc", r"\widehat"),
        (r"\hrulebar", "\n-----\n"),
        (r"\CC", r"{\mathbb C}"),
        (r"\FF", r"{\mathbb F}"),
        (r"\NN", r"{\mathbb N}"),
        (r"\QQ", r"{\mathbb Q}"),
        (r"\RR", r"{\mathbb R}"),
        (r"\ZZ", r"{\mathbb Z}"),
        (r"\ang", r"\ang"),
        (r"\dang", r"\dang"),
        (r"\ray", r"\overrightarrow"),
        (r"\id", r"\operatorname{id}"),
        (r"\inv", r"^{-1}"),
        (r"\dg", r"^{\circ}"),
        (r"\trans", r"^{\mathsf{T}}"),
        (r"\ii", r"\item"),
        (r"\opname", r"\operatorname"),
        (r"\OO", r"\mathcal{O}"),
        (r"\oo", r"\infty"),
        (r"\vp", r"\nu_"),
        (r"\ord", r"\operatorname{ord}_"),
        (r"\Pow", r"\operatorname{Pow}_"),
        (r"\dgnin", r"90^{\circ}"),
        (r"\dgone", r"180^{\circ}"),
    ]
    s = text
    for short, full in replacements:
        s = s.replace(short, full)
    return s


def remove_soft_newlines(text: str) -> str:
    return re.sub(r"[a-zA-Z]\n[a-zA-Z]", lambda m: m.group(0).replace("\n", " "), text)


def toAOPS(text: str) -> str:
    DIVIDER = "\n" + r"-------------------" + "\n\n"
    text = demacro_3(text)
    text = demacro_2(text)
    text = demacro_1(text)
    text = text.replace(r"\qedhere", "")
    text = text.replace(r"\begin{asy}", "\n" + "[asy]" + "\n")
    text = text.replace(r"\end{asy}", "\n" + "[/asy]")
    text = text.replace(r"\begin{center}", "")
    text = text.replace(r"\end{center}", "")
    text = text.replace(r"\par ", "\n")
    text = text.replace(r"\item ", "[*]")
    text = text.replace(r"\begin{enumerate}", "[list=1]")
    text = text.replace(r"\end{enumerate}", "[/list]")
    text = text.replace(r"\begin{itemize}", "[list]")
    text = text.replace(r"\end{itemize}", "[/list]")
    for env in [
        "theorem",
        "claim",
        "lemma",
        "proposition",
        "corollary",
        "definition",
        "remark",
    ]:
        text = text.replace(
            r"\begin{" + env + "*}",
            "\n\n" + "[b][color=red]" + env.title() + ":[/color][/b] ",
        )
        text = text.replace(r"\end{" + env + "*}", "")
        text = text.replace(
            r"\begin{" + env + "}",
            "\n\n" + "[b][color=red]" + env.title() + ":[/color][/b] ",
        )
        text = text.replace(r"\end{" + env + "}", "")
    text = text.replace(r"\begin{proof}", "[i]Proof.[/i] ")
    text = text.replace(r"\end{proof}", r"$\blacksquare$" + "\n")
    text = text.replace(r"\bigskip", DIVIDER)
    text = text.replace(r"\medskip", DIVIDER)
    text = text.replace(r"\#", "#")
    text = text.replace("%\n", "\n")  # strip trailing percent signs
    # Remove Asy opacities, doesn't work on AoPS
    text = re.sub(r"opacity\(0.[0-9]+\)+([^,]+), ", "invisible, ", text)
    # Replace \emph, \textit, et al
    text = re.sub(r"\\emph{([^}]*)}", r"[i]\1[/i]", text)
    text = re.sub(r"\\textit{([^}]*)}", r"[i]\1[/i]", text)
    text = re.sub(r"\\textbf{([^}]*)}", r"[b]\1[/b]", text)
    text = re.sub(
        r"\\paragraph{([^}]*)}", DIVIDER + r"[color=blue][b]\1[/b][/color]", text
    )
    text = re.sub(r"\\subparagraph{([^}]*)}", DIVIDER + r"[b]\1[/b]", text)
    text = re.sub(r"\\url{([^}]*)}", r"[url]\1[/url]", text)
    text = re.sub(r"\\href{([^}]*)}{([^}]*)}", r"[url=\1]\2[/url]", text)

    return text
    # # Join together newlines
    # paragraphs = [
    #     " ".join([line.strip() for line in paragraph.splitlines()]).strip()
    #     for paragraph in text.split("\n\n")
    # ]
    # return "\n".join(paragraphs)


cliptext = pyperclip.paste()
cliptext = remove_soft_newlines(toAOPS(cliptext))
pyperclip.copy(toAOPS(cliptext))
