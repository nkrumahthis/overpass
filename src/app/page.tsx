import { Button } from "@/components/ui/button";
import { GraduationCap, Hammer } from "lucide-react";

export default function Home() {
  return (
    <div className="font-sans grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen p-8 pb-20 gap-16 sm:p-20">
      <main className="flex flex-col gap-[24px] row-start-2 items-center sm:items-start">
        <div className="w-full flex items-center justify-center">
          <h1 className="text-4xl sm:text-5xl font-bold flex items-center gap-4 text-center">
          <GraduationCap className="w-20 h-20" />
          Overpass
        </h1>
        </div>
        <div className="flex flex-col items-center gap-2">
          <p className="text-lg text-muted-foreground text-center">
            A student data management system for SHS in Ghana.
          </p>
        </div>
        <div className="flex items-center justify-center w-full">
          <Button size="lg">Start now</Button>
        </div>
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
