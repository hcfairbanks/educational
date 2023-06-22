type ColorAction = {
  type: string
  color: string
}

type ColorType = (args: ColorAction) => ColorAction