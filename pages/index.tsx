import type { NextPage } from "next";
import Head from "next/head";

const Home: NextPage = () => {
  return (
    <>
      <Head>
        <title>Small Wins</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <main className="flex h-screen">
        <nav className="px-3 py-2 bg-gray-700">
          <h1 className="text-xl font-semibold text-white">Small Wins</h1>
        </nav>
        <div className="px-3 py-2">Hello!</div>
      </main>
    </>
  );
};

export default Home;
