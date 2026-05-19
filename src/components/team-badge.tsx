import type { Team } from "@/lib/champions-data";

const sizeMap = {
  sm: "h-9 w-9 text-[10px]",
  md: "h-12 w-12 text-xs",
  lg: "h-16 w-16 text-sm",
};

type TeamBadgeProps = {
  team: Team;
  size?: keyof typeof sizeMap;
};

export function TeamBadge({ team, size = "md" }: TeamBadgeProps) {
  return (
    <div
      className={`grid place-items-center rounded-full border border-white/20 font-semibold tracking-wide text-white shadow-[0_0_25px_rgba(67,199,255,0.2)] ${
        sizeMap[size]
      }`}
      style={{
        background: `linear-gradient(135deg, ${team.colors.from}, ${team.colors.to})`,
      }}
      aria-hidden="true"
    >
      {team.code}
    </div>
  );
}
