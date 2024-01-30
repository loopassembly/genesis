// main.js

import { create } from '@web3-storage/w3up-client';

async function main() {
  const client = await create();
  const space = await client.createSpace('my-awesome-space')
  const myAccount = await client.login('ashutoshanand2560@gmail.com')
  // Your code using the web3-storage client


while (true) {
    const res = await myAccount.plan.get()
    if (res.ok) break
    console.log('Waiting for payment plan to be selected...')
    await new Promise(resolve => setTimeout(resolve, 1000))
  }
  await myAccount.provision(space.did())
  await space.save()
}
main();
