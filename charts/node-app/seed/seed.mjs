// seeds an app by copying index.js, package.json and package-lock.json into a persistent store.
// this a bit of a unusual pattern but works well for reducing time spent on getting changes deployed when
// working on hobby projects
import {access, cp, realpath} from 'node:fs/promises'

const opts = {
    dereference: true,
    verbatimSymlinks: false
}
async function copyIfNotExists(source, dest) {
    try {
        await access(dest)
    } catch(ignored) {
        await cp(source, dest)
    }
}
await copyIfNotExists(await realpath('/seed/package.json'), '/app/package.json', opts)
await copyIfNotExists(await realpath('/seed/package-lock.json'), '/app/package-lock.json', opts)
await copyIfNotExists(await realpath('/seed/index.js'), '/app/index.js', opts)
