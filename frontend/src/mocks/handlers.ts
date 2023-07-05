import { rest } from 'msw'

export const handlers = [
  rest.get('http://127.0.0.1:3000/users', (req, res, ctx) => {

    return res(ctx.status(200),
      ctx.json(
          {
            id: 1,
            first_name: "bob",
            last_name:"boberson",
            req: req.method
          }
          )
    )
  }),
]