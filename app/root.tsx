import stylesheet from "~/styles/global.css";
import styles from 'bootstrap/dist/css/bootstrap.css';
import type { LinksFunction } from "@remix-run/node";
import { PageNotFound } from "~/components";
import {
  Links,
  LiveReload,
  Meta,
  Outlet,
  Scripts,
  ScrollRestoration,
} from "@remix-run/react";

export const links: LinksFunction = () => [
  {rel:"stylesheet", href: styles},
  {rel:"stylesheet", href: stylesheet},
];

export default function App() {
  return (
    <html lang="en">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href={stylesheet}></link>
        <Meta />
        <Links />
      </head>
      <body>
        <Outlet />
        <ScrollRestoration />
        <Scripts />
        <LiveReload />
      </body>
    </html>
  );
}

export function ErrorBoundary() {
  return (
    <html>
      <head>
        <title>Something weird happened...</title>
        <Meta />
        <Links />
      </head>
      <body>
        <PageNotFound />
        <Scripts />
      </body>
    </html>
  );
}

