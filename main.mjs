import { fetchGithubUser } from "@kuhltime/some-private-package"
import * as cowsay from 'cowsay'

const userPromise = fetchGithubUser('kuhltime')

userPromise
    .then(user => {
        console.log(cowsay.say({
            text: 'Hello ' + user.name
        }))
    })
    .catch(error => console.error(error))