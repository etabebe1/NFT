// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

abstract contract StatusConstants {
    string public constant UNVERIFIED_SVG =
        "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48c3ZnIHdpZHRoPSI4MDBweCIgaGVpZ2h0PSI4MDBweCIgdmlld0JveD0iMCAwIDE2IDE2IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGZpbGw9IiMwMDAwMDAiPjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNNy42NyAxNC43MmguNzFMMTAuMSAxM2gyLjRsLjUtLjV2LTIuNDJsMS43NC0xLjcydi0uNzFsLTEuNzEtMS43MlYzLjQ5bC0uNS0uNDlIMTAuMUw4LjM4IDEuMjloLS43MUw2IDNIMy41M0wzIDMuNXYyLjQzTDEuMzEgNy42NXYuNzFMMyAxMC4wOHYyLjQybC41My41SDZsMS42NyAxLjcyek02LjE2IDEySDRWOS44N2wtLjEyLS4zNUwyLjM3IDhsMS40OC0xLjUxLjE1LS4zNVY0aDIuMTZsLjM2LS4xNEw4IDIuMzVsMS41NCAxLjUxLjM1LjE0SDEydjIuMTRsLjE3LjM1TDEzLjY5IDhsLTEuNTUgMS41Mi0uMTQuMzVWMTJIOS44OWwtLjM4LjE1TDggMTMuNjZsLTEuNDgtMS41Mi0uMzYtLjE0em0xLjQ0My01Ljg1OWEuOTYyLjk2MiAwIDAgMC0uMTI4LjI5MWMtLjAzLjEwOS0uMDUuMjE1LS4wNjIuMzE3bC0uMDA1LjA0M2gtLjg5NWwuMDAzLS4wNTFjLjAxOC0uMzI2LjA4OS0uNjE1LjIxMi0uODY0LjA1Mi0uMTA4LjExNy0uMjE0LjE5My0uMzE4LjA4MS0uMTA2LjE4LS4yLjI5NC0uMjguMTE5LS4wODQuMjU1LS4xNS40MDktLjJBMS43MSAxLjcxIDAgMCAxIDguMTY1IDVjLjI4IDAgLjUyMy4wNDYuNzI2LjE0LjIuMDg5LjM2Ni4yMS40OTQuMzYzLjEyNy4xNTIuMjIuMzI2LjI3OS41Mi4wNTguMTk0LjA4Ny4zOTQuMDg3LjU5OSAwIC4xOTEtLjAzMi4zNzEtLjA5OC41NC0uMDY0LjE2NC0uMTQzLjMyLS4yMzguNDY2LS4wOTQuMTQzLS4xOTcuMjgtLjMxLjQxLS4xMS4xMjktLjIxMS4yNTItLjMwNC4zNzJhMi40NyAyLjQ3IDAgMCAwLS4yMy4zNC42NTMuNjUzIDAgMCAwLS4wODguMzE4di40OGgtLjg4OHYtLjUzOWMwLS4xNjguMDMxLS4zMjMuMDk0LS40NjRhMi4xNSAyLjE1IDAgMCAxIC4yNC0uNDAxYy4wOTYtLjEyNy4yLS4yNS4zMDgtLjM2OGE0Ljc0IDQuNzQgMCAwIDAgLjI5OS0uMzU2Yy4wOTMtLjEyLjE3LS4yNDYuMjI4LS4zNzdhLjk4NC45ODQgMCAwIDAgLjA5LS40MjEgMS4wNCAxLjA0IDAgMCAwLS4wNDctLjMxOHYtLjAwMWEuNjM4LjYzOCAwIDAgMC0uMTMtLjI0My41NTguNTU4IDAgMCAwLS4yMTYtLjE1OEg4LjQ2YS42ODkuNjg5IDAgMCAwLS4yOTQtLjA1OS42NDMuNjQzIDAgMCAwLS4zMzkuMDgzLjc0Mi43NDIgMCAwIDAtLjIyMy4yMTV6TTguNSAxMWgtLjg4OHYtLjg4OEg4LjVWMTF6Ii8+PC9zdmc+";

    string public constant VERIFIED_SVG =
        "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48c3ZnIHdpZHRoPSI4MDBweCIgaGVpZ2h0PSI4MDBweCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Ik04LjUgMTIuNUwxMC41IDE0LjVMMTUuNSA5LjUiIHN0cm9rZT0iIzFDMjc0QyIgc3Ryb2tlLXdpZHRoPSIxLjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIvPjxwYXRoIGQ9Ik0zLjAyOTA3IDEzLjA3NzZDMi43MDMyIDEyLjM5NTggMi43MDMyIDExLjYwMzIgMy4wMjkwNyAxMC45MjE0QzMuMTY5OTcgMTAuNjI2NiAzLjQxMDIzIDEwLjM0NDcgMy44OTA3NiA5Ljc4MDg0QzQuMDgyMDEgOS41NTY0MiA0LjE3NzY0IDkuNDQ0MjEgNC4yNTc5NiA5LjMyNDM3QzQuNDQyMDkgOS4wNDk2NSA0LjU2OTg4IDguNzQxMTQgNC42MzM5MyA4LjQxNjY5QzQuNjYxODggOC4yNzUxNSA0LjY3MzYgOC4xMjgxOSA0LjY5NzA2IDcuODM0MjZDNC43NTU5OSA3LjA5NTc2IDQuNzg1NDYgNi43MjY1MSA0Ljg5NDI3IDYuNDE4NDRDNS4xNDU5NCA1LjcwNTkxIDUuNzA2NCA1LjE0NTQ2IDYuNDE4OTMgNC44OTM3OEM2LjcyNjk5IDQuNzg0OTcgNy4wOTYyNSA0Ljc1NTUgNy44MzQ3NSA0LjY5NjU3QzguMTI4NjggNC42NzMxMiA4LjI3NTY0IDQuNjYxMzkgOC40MTcxOCA0LjYzMzQ0QzguNzQxNjMgNC41NjkzOSA5LjA1MDE0IDQuNDQxNiA5LjMyNDg1IDQuMjU3NDdDOS40NDQ3IDQuMTc3MTUgOS41NTY5MSA0LjA4MTUyIDkuNzgxMzMgMy44OTAyN0MxMC4zNDUyIDMuNDA5NzQgMTAuNjI3MSAzLjE2OTQ4IDEwLjkyMTkgMy4wMjg1OUMxMS42MDM3IDIuNzAyNzEgMTIuMzk2MyAyLjcwMjcxIDEzLjA3ODEgMy4wMjg1OUMxMy4zNzI5IDMuMTY5NDggMTMuNjU0OCAzLjQwOTc0IDE0LjIxODcgMy44OTAyN0MxNC40NDMxIDQuMDgxNTIgMTQuNTU1MyA0LjE3NzE1IDE0LjY3NTIgNC4yNTc0N0MxNC45NDk5IDQuNDQxNiAxNS4yNTg0IDQuNTY5MzkgMTUuNTgyOCA0LjYzMzQ0QzE1LjcyNDQgNC42NjEzOSAxNS44NzEzIDQuNjczMTIgMTYuMTY1MyA0LjY5NjU3QzE2LjkwMzggNC43NTU1IDE3LjI3MyA0Ljc4NDk3IDE3LjU4MTEgNC44OTM3OEMxOC4yOTM2IDUuMTQ1NDYgMTguODU0MSA1LjcwNTkxIDE5LjEwNTggNi40MTg0NE00Ljg5NDI3IDE3LjU4MDZDNS4xNDU5NCAxOC4yOTMxIDUuNzA2NCAxOC44NTM2IDYuNDE4OTMgMTkuMTA1M0M2LjcyNjk5IDE5LjIxNDEgNy4wOTYyNSAxOS4yNDM1IDcuODM0NzUgMTkuMzAyNUM4LjEyODY4IDE5LjMyNTkgOC4yNzU2NCAxOS4zMzc3IDguNDE3MTggMTkuMzY1NkM4Ljc0MTYzIDE5LjQyOTcgOS4wNTAxNCAxOS41NTc0IDkuMzI0ODUgMTkuNzQxNkM5LjQ0NDY5IDE5LjgyMTkgOS41NTY5MSAxOS45MTc1IDkuNzgxMzMgMjAuMTA4OEMxMC4zNDUyIDIwLjU4OTMgMTAuNjI3MSAyMC44Mjk2IDEwLjkyMTkgMjAuOTcwNUMxMS42MDM3IDIxLjI5NjMgMTIuMzk2MyAyMS4yOTYzIDEzLjA3ODEgMjAuOTcwNUMxMy4zNzI5IDIwLjgyOTYgMTMuNjU0OCAyMC41ODkzIDE0LjIxODcgMjAuMTA4OEMxNC40NDMxIDE5LjkxNzUgMTQuNTU1MyAxOS44MjE5IDE0LjY3NTIgMTkuNzQxNkMxNC45NDk5IDE5LjU1NzQgMTUuMjU4NCAxOS40Mjk3IDE1LjU4MjggMTkuMzY1NkMxNS43MjQ0IDE5LjMzNzcgMTUuODcxMyAxOS4zMjU5IDE2LjE2NTMgMTkuMzAyNUMxNi45MDM4IDE5LjI0MzUgMTcuMjczIDE5LjIxNDEgMTcuNTgxMSAxOS4xMDUzQzE4LjI5MzYgMTguODUzNiAxOC44NTQxIDE4LjI5MzEgMTkuMTA1OCAxNy41ODA2QzE5LjIxNDYgMTcuMjcyNSAxOS4yNDQgMTYuOTAzMyAxOS4zMDMgMTYuMTY0OEMxOS4zMjY0IDE1Ljg3MDkgMTkuMzM4MSAxNS43MjM5IDE5LjM2NjEgMTUuNTgyNEMxOS40MzAxIDE1LjI1NzkgMTkuNTU3OSAxNC45NDk0IDE5Ljc0MjEgMTQuNjc0N0MxOS44MjI0IDE0LjU1NDggMTkuOTE4IDE0LjQ0MjYgMjAuMTA5MyAxNC4yMTgyQzIwLjU4OTggMTMuNjU0MyAyMC44MzAxIDEzLjM3MjQgMjAuOTcxIDEzLjA3NzZDMjEuMjk2OCAxMi4zOTU4IDIxLjI5NjggMTEuNjAzMiAyMC45NzEgMTAuOTIxNCIgc3Ryb2tlPSIjMUMyNzRDIiBzdHJva2Utd2lkdGg9IjEuNSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIi8+PC9zdmc+";
}

abstract contract HardCodedSvg {
    string public constant HARDCODED_UNVERIFIED_SVG =
        '<?xml version="1.0" encoding="utf-8"?><svg width="800px" height="800px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" fill="#000000"><path fill-rule="evenodd" clip-rule="evenodd" d="M7.67 14.72h.71L10.1 13h2.4l.5-.5v-2.42l1.74-1.72v-.71l-1.71-1.72V3.49l-.5-.49H10.1L8.38 1.29h-.71L6 3H3.53L3 3.5v2.43L1.31 7.65v.71L3 10.08v2.42l.53.5H6l1.67 1.72zM6.16 12H4V9.87l-.12-.35L2.37 8l1.48-1.51.15-.35V4h2.16l.36-.14L8 2.35l1.54 1.51.35.14H12v2.14l.17.35L13.69 8l-1.55 1.52-.14.35V12H9.89l-.38.15L8 13.66l-1.48-1.52-.36-.14zm1.443-5.859a.962.962 0 0 0-.128.291c-.03.109-.05.215-.062.317l-.005.043h-.895l.003-.051c.018-.326.089-.615.212-.864.052-.108.117-.214.193-.318.081-.106.18-.2.294-.28.119-.084.255-.15.409-.2A1.71 1.71 0 0 1 8.165 5c.28 0 .523.046.726.14.2.089.366.21.494.363.127.152.22.326.279.52.058.194.087.394.087.599 0 .191-.032.371-.098.54-.064.164-.143.32-.238.466-.094.143-.197.28-.31.41-.11.129-.211.252-.304.372a2.47 2.47 0 0 0-.23.34.653.653 0 0 0-.088.318v.48h-.888v-.539c0-.168.031-.323.094-.464a2.15 2.15 0 0 1 .24-.401c.096-.127.2-.25.308-.368a4.74 4.74 0 0 0 .299-.356c.093-.12.17-.246.228-.377a.984.984 0 0 0 .09-.421 1.04 1.04 0 0 0-.047-.318v-.001a.638.638 0 0 0-.13-.243.558.558 0 0 0-.216-.158H8.46a.689.689 0 0 0-.294-.059.643.643 0 0 0-.339.083.742.742 0 0 0-.223.215zM8.5 11h-.888v-.888H8.5V11z"/></svg>';

    string public constant HARDCODED_VERIFIED_SVG =
        '<?xml version="1.0" encoding="utf-8"?><svg width="800px" height="800px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" fill="#000000"><path fill-rule="evenodd" clip-rule="evenodd" d="M7.67 14.72h.71L10.1 13h2.4l.5-.5v-2.42l1.74-1.72v-.71l-1.71-1.72V3.49l-.5-.49H10.1L8.38 1.29h-.71L6 3H3.53L3 3.5v2.43L1.31 7.65v.71L3 10.08v2.42l.53.5H6l1.67 1.72zM6.16 12H4V9.87l-.12-.35L2.37 8l1.48-1.51.15-.35V4h2.16l.36-.14L8 2.35l1.54 1.51.35.14H12v2.14l.17.35L13.69 8l-1.55 1.52-.14.35V12H9.89l-.38.15L8 13.66l-1.48-1.52-.36-.14zm1.443-5.859a.962.962 0 0 0-.128.291c-.03.109-.05.215-.062.317l-.005.043h-.895l.003-.051c.018-.326.089-.615.212-.864.052-.108.117-.214.193-.318.081-.106.18-.2.294-.28.119-.084.255-.15.409-.2A1.71 1.71 0 0 1 8.165 5c.28 0 .523.046.726.14.2.089.366.21.494.363.127.152.22.326.279.52.058.194.087.394.087.599 0 .191-.032.371-.098.54-.064.164-.143.32-.238.466-.094.143-.197.28-.31.41-.11.129-.211.252-.304.372a2.47 2.47 0 0 0-.23.34.653.653 0 0 0-.088.318v.48h-.888v-.539c0-.168.031-.323.094-.464a2.15 2.15 0 0 1 .24-.401c.096-.127.2-.25.308-.368a4.74 4.74 0 0 0 .299-.356c.093-.12.17-.246.228-.377a.984.984 0 0 0 .09-.421 1.04 1.04 0 0 0-.047-.318v-.001a.638.638 0 0 0-.13-.243.558.558 0 0 0-.216-.158H8.46a.689.689 0 0 0-.294-.059.643.643 0 0 0-.339.083.742.742 0 0 0-.223.215zM8.5 11h-.888v-.888H8.5V11z"/></svg>';
}
