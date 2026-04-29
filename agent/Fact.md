🚀 PRD MVP: NextGen Mobile Builder (Lean MVP)

Mobile UI Block Editor → JSX Generator

Shadcn-style UI sketching on mobile, focused on clean JSX output


---

1. 📌 PRODUCT OVERVIEW

Field	Detail

Product Name	NextGen Mobile Builder
Product Type	Mobile App (Godot)
MVP Goal	Validate mobile UI editing + JSX generation
Primary Output	Clean JSX (Shadcn-style)
Target Platform	Android (MVP)
MVP Duration	4 weeks
Monetization (Later)	Not included in MVP



---

2. 🎯 MVP GOAL

This MVP exists to validate only 2 core assumptions:

Assumption 1

Users can sketch basic web UI blocks on mobile fast enough to be useful.

Assumption 2

Generated JSX is clean enough that developers find it valuable.

If these 2 assumptions fail, the product should not continue in current direction.


---

3. 🧭 PRODUCT POSITIONING

This is NOT:

Figma on mobile

Framer on mobile

Full no-code builder

Website builder

Full Next.js generator


This IS:

> A mobile-first UI block editor for quickly sketching web UI and exporting clean JSX.



Core promise:

> Drag UI blocks → edit props → copy clean JSX




---

4. 👤 TARGET USER (MVP)

Primary User

Indie Developer / Freelancer

Needs:

Quickly sketch a UI idea on phone

Turn idea into usable JSX

Avoid starting from blank page


Pain:

Figma mobile is not usable for editing

Wireframe tools are too abstract

Website builders are too heavy

Writing layout from scratch on mobile is slow


Desired outcome:

Sketch rough UI in minutes

Copy usable JSX

Continue on desktop later



---

5. 🎯 MVP SCOPE

Included in MVP

Core Editor

Canvas

Drag & Drop

Select component

Resize component

Inspector panel

Local save/load


Component Library (3 only)

Button

Card

Container


Editing

Edit text

Edit color

Edit variant


Output

JSON project structure

JSX generation

Code preview

Copy JSX



---

Explicitly Excluded from MVP

Not in MVP

Undo / Redo

Layers panel

Zoom / Pan

Multi-select

Input component

State / logic binding

Actions / click logic

Full page routing

Tailwind class customization

Next.js project export

ZIP export

Vercel deploy

GitHub sync

Templates

Cloud sync

Auth

Monetization

Analytics



---

6. 🧱 CORE USER FLOW

Primary flow

1. Open app


2. Drag block from palette


3. Drop on canvas


4. Select block


5. Edit text / color / variant


6. Resize block


7. Save locally


8. Open code preview


9. Copy JSX



This is the only flow MVP must do well.


---

7. 🧩 MVP COMPONENTS

1. Button

Purpose: CTA / actions

Editable props:

label

variant (default, outline, ghost)

textColor

bgColor

width

height


Example output:

<Button variant="default">Get Started</Button>


---

2. Card

Purpose: content grouping

Editable props:

title

description

variant

bgColor

width

height


Example output:

<Card>
  <CardHeader>
    <CardTitle>Revenue</CardTitle>
    <CardDescription>Monthly growth</CardDescription>
  </CardHeader>
</Card>


---

3. Container

Purpose: layout grouping

Editable props:

direction (row, column)

gap

padding

align

bgColor

width

height


Example output:

<div className="flex flex-col gap-4">
  {children}
</div>


---

8. 🏗️ TECHNICAL ARCHITECTURE (MVP)

Architecture Principle

Keep architecture modular, but lightweight.

No over-engineering.
No systems for future features not in MVP.


---

Folder Structure

res://
├── core/
│   ├── models/
│   │   ├── ComponentNode.gd
│   │   └── ProjectData.gd
│   ├── utils/
│   │   ├── UUIDGen.gd
│   │   └── JsonHelper.gd
│   └── constants/
│       └── UIConstants.gd
│
├── editor/
│   ├── canvas/
│   │   ├── Canvas.tscn
│   │   ├── Canvas.gd
│   │   ├── DragDropHandler.gd
│   │   └── ResizeHandles.gd
│   ├── inspector/
│   │   ├── Inspector.tscn
│   │   ├── Inspector.gd
│   │   └── fields/
│   │       ├── TextField.tscn
│   │       ├── ColorField.tscn
│   │       └── SelectField.tscn
│   └── EditorView.tscn
│
├── components/
│   ├── registry/
│   │   ├── ComponentRegistry.gd
│   │   └── definitions/
│   │       ├── ButtonDef.gd
│   │       ├── CardDef.gd
│   │       └── ContainerDef.gd
│   ├── renderer/
│   │   └── ComponentRenderer.gd
│   └── palette/
│       ├── Palette.tscn
│       └── Palette.gd
│
├── compiler/
│   ├── CodeCompiler.gd
│   ├── JsxGenerator.gd
│   └── formatters/
│       └── JsFormatter.gd
│
├── state/
│   ├── ProjectStore.gd
│   └── SelectionManager.gd
│
└── screens/
    └── editor_screen/
        ├── EditorScreen.tscn
        └── EditorScreen.gd


---

9. 📦 DATA MODEL

ComponentNode

Represents one UI block on canvas.

Fields:

id

type

props

children

position

size



---

ProjectData

Represents entire local project.

Fields:

id

name

components[]



---

10. 🧠 MVP SUCCESS CRITERIA

MVP succeeds only if:

Success Metric 1

A user can build a rough UI layout on mobile in under 3 minutes.

Success Metric 2

Generated JSX is understandable and reusable without major rewrite.

Success Metric 3

The editor feels usable enough that users prefer it over rough wireframe apps.


---

11. ⚠️ RISKS

Risk	Severity	Mitigation

Drag/drop feels bad on mobile	High	Validate in week 1
Resize is frustrating	High	Keep simple handles only
JSX output is messy	High	Prioritize compiler quality
Scope creep	Critical	Lock MVP scope hard



---

12. 🚫 MVP RULES (NON-NEGOTIABLE)

1. No feature outside MVP scope


2. No adding components beyond 3


3. No backend


4. No auth


5. No deploy


6. No monetization


7. No “just one more feature”



If a feature does not directly improve:

mobile editing or

JSX output


it does not belong in MVP.


---

13. ✅ MVP DEFINITION OF DONE

MVP is done when:

User can drag Button / Card / Container onto canvas

User can edit props in inspector

User can resize components

User can save/load locally

User can preview generated JSX

User can copy JSX successfully


Nothing else is required for MVP.


---

14. 📌 CORE PRINCIPLE

> MVP is not meant to prove the full product.
MVP is only meant to prove that mobile UI editing + JSX generation is worth continuing.


MVP rút gọn (4 tuần / 28 ngày)

Mục tiêu duy nhất: validate 2 thứ

1. mobile editor usable


2. JSON → JSX đủ sạch để đáng tiền



Scope khóa cứng (không thêm ngoài danh sách này):

Canvas

Drag / Drop

Select

Resize

Inspector

Local Save / Load

3 block: Button / Card / Container

JSON → JSX

Copy code


Không làm trong MVP này:

Undo / Redo

Layers

Zoom

Multi-select

Input

State / Actions

Zip

Next scaffold

Vercel / GitHub

Auth / Cloud

Payment



---

Cấu trúc thư mục MVP (bản nhẹ)

Giữ tinh thần structure cũ nhưng flatten vừa đủ để solo chạy nhanh.

res://
├── core/
│   ├── models/
│   │   ├── ComponentNode.gd
│   │   └── ProjectData.gd
│   ├── utils/
│   │   ├── UUIDGen.gd
│   │   └── JsonHelper.gd
│   └── constants/
│       └── UIConstants.gd
│
├── editor/
│   ├── canvas/
│   │   ├── Canvas.tscn
│   │   ├── Canvas.gd
│   │   ├── DragDropHandler.gd
│   │   └── ResizeHandles.gd
│   ├── inspector/
│   │   ├── Inspector.tscn
│   │   ├── Inspector.gd
│   │   └── fields/
│   │       ├── TextField.tscn
│   │       ├── ColorField.tscn
│   │       └── SelectField.tscn
│   └── EditorView.tscn
│
├── components/
│   ├── registry/
│   │   ├── ComponentRegistry.gd
│   │   └── definitions/
│   │       ├── ButtonDef.gd
│   │       ├── CardDef.gd
│   │       └── ContainerDef.gd
│   ├── renderer/
│   │   └── ComponentRenderer.gd
│   └── palette/
│       ├── Palette.tscn
│       └── Palette.gd
│
├── compiler/
│   ├── CodeCompiler.gd
│   ├── JsxGenerator.gd
│   └── formatters/
│       └── JsFormatter.gd
│
├── state/
│   ├── ProjectStore.gd
│   └── SelectionManager.gd
│
└── screens/
    └── editor_screen/
        ├── EditorScreen.tscn
        └── EditorScreen.gd


---

Nguyên tắc làm mỗi ngày

Mỗi ngày chỉ có 1 deliverable rõ ràng.
Nếu xong sớm: polish.
Nếu chưa xong: không mở scope mới.

Mỗi ngày phải kết thúc với:

chạy được

test được

có thứ nhìn thấy được



---

WEEK 1 — Core editor skeleton

Mục tiêu tuần: kéo được 1 block lên canvas và chọn được nó


---

Day 1 — Project bootstrap

Goal: app chạy được với layout editor cơ bản

Làm

tạo Godot project

setup folder structure

tạo EditorScreen.tscn

chia layout 3 vùng:

top bar

canvas

bottom palette


setup theme base (spacing, colors, font)


Deliverable

Mở app thấy khung editor trống chạy ổn trên mobile.


---

Day 2 — Data foundation

Goal: có data model chuẩn để mọi thứ bám vào

Làm

ComponentNode.gd

ProjectData.gd

UUIDGen.gd

ProjectStore.gd


Deliverable

Tạo được project in-memory + add component node vào data.


---

Day 3 — Canvas foundation

Goal: có canvas render được object rỗng

Làm

Canvas.tscn

Canvas.gd

render test rectangle từ ComponentNode

tap chọn node


Deliverable

Canvas render được 1 block giả + tap select được.


---

Day 4 — Selection system

Goal: chọn block thấy trạng thái selected rõ ràng

Làm

SelectionManager.gd

selected outline

selected state sync canvas


Deliverable

Tap block → highlight viền chọn.


---

Day 5 — Palette foundation

Goal: có palette kéo block vào canvas

Làm

Palette.tscn

Palette.gd

3 item fake:

Button

Card

Container



Deliverable

Có palette hiển thị 3 block.


---

Day 6 — Drag & Drop MVP

Goal: kéo block từ palette vào canvas

Làm

DragDropHandler.gd

drag ghost preview

drop tạo ComponentNode


Deliverable

Kéo Button từ palette vào canvas và spawn được block.


---

Day 7 — Buffer / polish day

Goal: fix tuần 1

Làm

fix drag jitter

fix selection bugs

cleanup structure


Deliverable

Week 1 stable demo.


---

WEEK 2 — Real blocks + inspector

Mục tiêu tuần: block nhìn giống UI thật và sửa được props


---

Day 8 — Component registry

Goal: component definitions hoạt động

Làm

ComponentRegistry.gd

ButtonDef.gd

CardDef.gd

ContainerDef.gd


Deliverable

Registry trả về default schema cho 3 block.


---

Day 9 — Component renderer

Goal: render block theo type

Làm

ComponentRenderer.gd

render Button

render Card

render Container


Deliverable

3 block nhìn ra UI thật, không còn rectangle fake.


---

Day 10 — Inspector shell

Goal: có panel edit props

Làm

Inspector.tscn

Inspector.gd

bind selected node → inspector


Deliverable

Tap block → inspector hiện props.


---

Day 11 — Text editing

Goal: sửa text được

Làm

TextField.tscn

bind title / label edit


Deliverable

Sửa text trong inspector → block update realtime.


---

Day 12 — Color editing

Goal: đổi màu được

Làm

ColorField.tscn

background / text color


Deliverable

Đổi màu block từ inspector.


---

Day 13 — Variant editing

Goal: select props hoạt động

Làm

SelectField.tscn

button variant

card style


Deliverable

Đổi variant block.


---

Day 14 — Buffer / polish day

Fix render + inspector sync.


---

WEEK 3 — Resize + local save

Mục tiêu tuần: block usable như tool thật


---

Day 15 — Resize handles

Goal: kéo giãn block

Làm

ResizeHandles.gd

right / bottom handles


Deliverable

Resize được block.


---

Day 16 — Layout constraints

Goal: resize không vỡ layout

Làm

min width

min height

content padding rules


Deliverable

Resize usable.


---

Day 17 — Container nesting

Goal: Container chứa child

Làm

drop vào container

vertical stack đơn giản


Deliverable

Container chứa Button/Card.


---

Day 18 — Local save

Goal: lưu project local

Làm

JsonHelper.gd

serialize project


Deliverable

Save JSON local.


---

Day 19 — Local load

Goal: load lại project

Làm

deserialize project

rebuild canvas


Deliverable

Mở lại project đúng layout.


---

Day 20 — Basic recovery

Goal: app không chết khi data lỗi

Làm

fallback invalid JSON

missing props guard


Deliverable

Load lỗi không crash.


---

Day 21 — Buffer / polish day

Fix resize + save/load.


---

WEEK 4 — Code output

Mục tiêu tuần: xuất JSX sạch và copy được


---

Day 22 — JSX generator skeleton

Goal: node → JSX

Làm

JsxGenerator.gd

render tree → JSX string


Deliverable

1 Button → JSX.


---

Day 23 — Compile Button / Card / Container

Goal: 3 block compile được

Làm

JSX mapping từng block


Deliverable

Toàn bộ 3 block compile ra JSX.


---

Day 24 — Formatter

Goal: code dễ đọc

Làm

JsFormatter.gd

indent / spacing cleanup


Deliverable

JSX readable.


---

Day 25 — Code preview panel

Goal: xem code trong app

Làm

side/bottom code preview panel


Deliverable

Thấy code generated.


---

Day 26 — Copy code

Goal: copy JSX

Làm

copy to clipboard button


Deliverable

Copy JSX thành công.


---

Day 27 — End-to-end pass

Goal: flow hoàn chỉnh

Test flow

kéo block

sửa text

đổi màu

resize

save

load

copy JSX


Deliverable

MVP usable end-to-end.


---

Day 28 — Polish + record demo

Goal: chốt MVP

Làm

bug fixes

small UX polish

record 30–60s demo


Deliverable

MVP demo sẵn để tự review / share test.


---

Sau 28 ngày bạn phải trả lời được 3 câu

1. mobile editor có đủ mượt để dùng tiếp không?


2. JSX output có đủ sạch để đáng build tiếp không?


3. user thấy “tiện hơn mockup app” hay không?



Nếu 3 câu này = có
→ build V1

Nếu không
→ pivot sớm, không đốt thêm 3–6 tháng.