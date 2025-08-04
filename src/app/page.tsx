import { Button } from "@/components/ui/button";
import { GraduationCap, Hammer } from "lucide-react";
import Image from "next/image";

export default function Home() {
  return (
    <div className="font-sans grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen p-8 pb-20 gap-16 sm:p-20">
      <main className="flex flex-col gap-[24px] row-start-2 items-center sm:items-start">
        <h1 className="text-4xl sm:text-5xl font-bold flex items-center gap-4">
          <GraduationCap className="w-20 h-20" />
          Overpass
        </h1>
        <p className="text-lg text-muted-foreground">
          A student data management system for SHS in Ghana.
        </p>
        <Button>Start now</Button>
      </main>
      <footer className="row-start-3 flex gap-[24px] flex-wrap items-center justify-center">
        <a
          className="flex items-center gap-2 hover:underline hover:underline-offset-4"
          href="https://nkrumahsarpong.com"
          target="_blank"
          rel="noopener noreferrer"
        >
          <Hammer className="w-6 h-6" />
          Built by Emmanuel Nkrumah Sarpong
        </a>

      </footer>
    </div>
  );
}
