SCNU DSE Undergraduate Thesis LaTeX Template

A LaTeX thesis template for undergraduate students of the School of Data Science and Engineering, South China Normal University (SCNU)

Introduction | 项目简介

English

This repository provides a clean and easy-to-use LaTeX template for undergraduate thesis writing at the School of Data Science and Engineering, South China Normal University (SCNU).

The template is adapted from the original SCNU template on Overleaf and further improved for better structure, readability, and usability. It is designed to help undergraduate students quickly get started with thesis writing using LaTeX.

中文

本项目提供一个适用于华南师范大学数据科学与工程学院本科毕业论文的 LaTeX 模板。

该模板基于 Overleaf 上的 SCNU 模板进行改进与优化，使其在结构、可读性以及易用性方面更加友好，方便本科生快速上手 LaTeX 论文写作。

Features | 特性
支持中英文摘要（Bilingual abstract support）
自动生成封面（Automatic cover page）
标准论文结构（Standard thesis structure）
提供图、表、公式示例（Figures, tables, equations examples）
支持 BibTeX 参考文献（BibTeX support）
开箱即用（Ready-to-use）
Project Structure | 项目结构

.
├── main.tex # 主文件
├── SCNU.cls # 模板类文件
├── refs.bib # 参考文献
├── figures/ # 图片文件夹（可选）
└── README.md

Usage | 使用方法
Compile | 编译方式

xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex

Overleaf 使用

将整个项目上传到 Overleaf 即可在线编辑与编译：

https://www.overleaf.com/

本地编译

建议使用以下环境：

TeX Live
XeLaTeX
How to Use | 使用说明
修改 main.tex 中的基本信息：
论文标题
姓名
学号
指导教师
按照章节结构填写内容：
绪论
方法
实验
结论
插入论文内容：
图片（figure）
表格（table）
公式（equation）
Notes | 注意事项
本模板为非官方模板，仅供学习与参考使用
请以学校最终格式要求为准
建议在提交前进行格式检查
Acknowledgement | 致谢

This template is adapted from the original SCNU template on Overleaf:

https://www.overleaf.com/latex/templates/scnu-my-article/jkbbvhnddtsw

Special thanks to the original authors.

License | 开源协议

This project is intended for academic use only.

If the original template has a license, this project follows the same license.

Star This Repo | 支持一下

If this project helps you, please consider giving it a star!

如果这个项目对你有帮助，欢迎点个 star ⭐！
