Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7C16E004AB
	for <meta-ti@yoctoproject.org>; Thu, 20 Sep 2012 05:22:32 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8KCMTgn028389;
	Thu, 20 Sep 2012 07:22:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8KCMTae028365;
	Thu, 20 Sep 2012 07:22:29 -0500
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Thu, 20 Sep 2012 07:22:29 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "ndec13@gmail.com" <ndec13@gmail.com>
Thread-Topic: [meta-ti] building yocto images with meta-ti
Thread-Index: AQHNli5TJ5o+/42HmUClbrZPh1hdPZeRwa2AgABmlYD//8M8gIABQnQA///65eM=
Date: Thu, 20 Sep 2012 12:22:28 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E630DAF@DLEE09.ent.ti.com>
References: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
	<20120919135659.GA589@edge>
	<CAOT3miK4MM-LqDC0AFuZh3hH145qrYoxW1w27P4dXRTCR2X=hQ@mail.gmail.com>
	<20120919162639.GC589@edge>,
	<CAOT3miK2M7e5AbYLevSqXD7vx7N_+FUY-8P6k4sFXu1Xxjd4sQ@mail.gmail.com>
In-Reply-To: <CAOT3miK2M7e5AbYLevSqXD7vx7N_+FUY-8P6k4sFXu1Xxjd4sQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: building yocto images with meta-ti
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2012 12:22:32 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E630DAFDLEE09entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E630DAFDLEE09entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I think you missed my explanation - please re-read. I didn't say you should=
 go to denzil, I said you need to update your bblayers.conf

Denys


-----Original Message-----
From: Nicolas Dechesne [ndec13@gmail.com]
Received: Thursday, 20 Sep 2012, 3:41
To: Dmytriyenko, Denys [denys@ti.com]
CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: Re: [meta-ti] building yocto images with meta-ti

On Wed, Sep 19, 2012 at 6:26 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Wed, Sep 19, 2012 at 06:04:09PM +0200, Nicolas Dechesne wrote:
>> hi,
>>
>> thanks for your answers
>>
>> On Wed, Sep 19, 2012 at 3:57 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>> > On Wed, Sep 19, 2012 at 08:16:05AM +0200, Nicolas Dechesne wrote:
>> >> hi there,
>> >
>> > Hi Nicolas,
>> >
>> >> i was able to build a 'vanilla' yocto image using the yocto git repo.
>> >> then i wanted to add meta-ti layer. so i have done the following:
>> >
>> > First, a little rant... :)
>> >
>> > It's unfortunate, but this still causes lots of confusion. Some purist=
s among
>> > us will say that is not Yocto, but Poky. Case in point - which "yocto"=
 git
>> > repository you cloned from http://git.yoctoproject.org/ ?
>>
>> so yes, I meant Poky. It was indeed quite subtle to me, and I didn't
>> realize there was a difference between yocto and poky ;-)
>
> It is somewhat convoluted, but in general, Poky is a reference distributi=
on
> and released product built on top of OpenEmbedded-Core. The Yocto Project=
 is
> an umbrella entity for different projects and initiatives based on the co=
mmon
> infrastructure, such as OpenEmbedded-Core, BitBake etc. There are other
> distributions and projects building on top of OE-Core, such as Angstrom, =
Arago
> etc., that are supposed to be part of the Yocto Project as well. See Yoct=
o
> Project branding compliance program for official guidelines, that were
> standardized recently... But the Yocto Project Universe is much larger th=
an
> Poky - there are at least 50 different layers that you can mix and match,
> ranging from different BSPs to different Software stacks...
>
>
>> just to clarify, I had cloned:
>>
>> git://git.yoctoproject.org/poky.git, commit
>> 913944d904266bf90af0cad94b4f0fb3652bd29d (master)
>> git://git.yoctoproject.org/meta-ti, commit
>> 9ef35da0c8ff3be8f37214e09d0fc1d4987a11fc (master)
>>
>> and I had put in my local.conf:
>>
>> BBMASK =3D "meta-ti/recipes-misc"
>>
>> as per the README. I didn't find any other useful information in the
>> README, though.
>>
>> is there a good wiki / doc that explains what each of this thing is:
>> OE vs poky vs yocto vs arago?
>
> Some of that is explained above. I can go into more details offline, if y=
ou
> wish.
>
>
>> is that wrong to expect to be able to build a poky image by combining
>> meta-ti and poky.git?
>
> Absolutely not! And I've been building that combination among other thing=
s -
> either core-image-minimal or core-image-sato.
>
>
>> > Same applies to a 'vanilla' yocto image, which does not exist. It woul=
d rather
>> > be useful to specify which exact image for which MACHINE you are tryin=
g to
>> > build. A little bit more detail is always helpful...
>> >
>> >
>> > And now to the resolution part. I see you already used BBMASK as presc=
ribed in
>> > the README, since you get past the unset LICENSE error... The below er=
ror
>> > happens when you build for a MACHINE that is overshadowed by another B=
SP
>> > layer that does not define MACHINE_KERNEL_PR. This MACHINE_KERNEL_PR v=
ariable
>> > is set in MACHINE definitions of meta-ti BSP layer and then used in ot=
her
>> > recipes within meta-ti and different layers.
>> >
>> > In other words, you are trying to build for "beagleboard" machine, whi=
ch gets
>> > also defined by meta-yocto-bsp layer, besides meta-ti. The solution is=
 simple -
>> > you need to move meta-ti above meta-yocto-bsp in your bblayers.conf or=
 just
>> > remove meta-yocto-bsp from the list, if you are not planning on buildi=
ng any
>> > of the reference platforms. That way you'll get the machine definition=
 from
>> > meta-ti layer and not from meta-yocto-bsp.
>> >
>> > After that, core-image-minimal and some other images should build fine=
. Good
>> > luck!
>>
>> ok, so based on the feedback, i have moved poky.git to denzil branch,
>> and meta-ti to denzil branch too. is that expected to be a good
>> combination?
>
> Depends on which direction you go. Denzil branch is usually considered mo=
re
> stable than master, although master is now feature-frozen for stabilizati=
on
> before the next release. Unless you start mixing meta-oe and step on to
> systemd issues, as systemd in denzil is not that clean. Anyway, for a sim=
ple
> poky+meta-ti combination and images from meta/ directory it should be fin=
e.
>
>
>> my build has restarted fine... i will check the build when they complete=
.
>
> Let us know. Like I said, I've been building both core-image-minimal and
> core-image-sato w/o problems before.

using denzil branch on both poky.git and meta-ti, i was able to
generate a poky/sato image for beagle. thx.

so what if I want to use poky.git master? is there a meta-ti branch
that works in this case? I think this is what i tried initially (which
triggered that email) which didn't work.


>
> --
> Denys

--_000_B0581B5571079145BA1CD78C126DBDE72E630DAFDLEE09entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">I think you missed my explanation - please re-read. I didn=
't say you should go to denzil, I said you need to update your bblayers.con=
f<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Nicolas Dechesne [ndec13@gmail.com]<br>
<b>Received:</b> Thursday, 20 Sep 2012, 3:41<br>
<b>To:</b> Dmytriyenko, Denys [denys@ti.com]<br>
<b>CC:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> Re: [meta-ti] building yocto images with meta-ti<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Wed, Sep 19, 2012 at 6:26 PM, Denys Dmytriyenko=
 &lt;denys@ti.com&gt; wrote:<br>
&gt; On Wed, Sep 19, 2012 at 06:04:09PM &#43;0200, Nicolas Dechesne wrote:<=
br>
&gt;&gt; hi,<br>
&gt;&gt;<br>
&gt;&gt; thanks for your answers<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Sep 19, 2012 at 3:57 PM, Denys Dmytriyenko &lt;denys@ti.co=
m&gt; wrote:<br>
&gt;&gt; &gt; On Wed, Sep 19, 2012 at 08:16:05AM &#43;0200, Nicolas Dechesn=
e wrote:<br>
&gt;&gt; &gt;&gt; hi there,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Nicolas,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; i was able to build a 'vanilla' yocto image using the yoc=
to git repo.<br>
&gt;&gt; &gt;&gt; then i wanted to add meta-ti layer. so i have done the fo=
llowing:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; First, a little rant... :)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It's unfortunate, but this still causes lots of confusion. So=
me purists among<br>
&gt;&gt; &gt; us will say that is not Yocto, but Poky. Case in point - whic=
h &quot;yocto&quot; git<br>
&gt;&gt; &gt; repository you cloned from <a href=3D"http://git.yoctoproject=
.org/">http://git.yoctoproject.org/</a> ?<br>
&gt;&gt;<br>
&gt;&gt; so yes, I meant Poky. It was indeed quite subtle to me, and I didn=
't<br>
&gt;&gt; realize there was a difference between yocto and poky ;-)<br>
&gt;<br>
&gt; It is somewhat convoluted, but in general, Poky is a reference distrib=
ution<br>
&gt; and released product built on top of OpenEmbedded-Core. The Yocto Proj=
ect is<br>
&gt; an umbrella entity for different projects and initiatives based on the=
 common<br>
&gt; infrastructure, such as OpenEmbedded-Core, BitBake etc. There are othe=
r<br>
&gt; distributions and projects building on top of OE-Core, such as Angstro=
m, Arago<br>
&gt; etc., that are supposed to be part of the Yocto Project as well. See Y=
octo<br>
&gt; Project branding compliance program for official guidelines, that were=
<br>
&gt; standardized recently... But the Yocto Project Universe is much larger=
 than<br>
&gt; Poky - there are at least 50 different layers that you can mix and mat=
ch,<br>
&gt; ranging from different BSPs to different Software stacks...<br>
&gt;<br>
&gt;<br>
&gt;&gt; just to clarify, I had cloned:<br>
&gt;&gt;<br>
&gt;&gt; git://git.yoctoproject.org/poky.git, commit<br>
&gt;&gt; 913944d904266bf90af0cad94b4f0fb3652bd29d (master)<br>
&gt;&gt; git://git.yoctoproject.org/meta-ti, commit<br>
&gt;&gt; 9ef35da0c8ff3be8f37214e09d0fc1d4987a11fc (master)<br>
&gt;&gt;<br>
&gt;&gt; and I had put in my local.conf:<br>
&gt;&gt;<br>
&gt;&gt; BBMASK =3D &quot;meta-ti/recipes-misc&quot;<br>
&gt;&gt;<br>
&gt;&gt; as per the README. I didn't find any other useful information in t=
he<br>
&gt;&gt; README, though.<br>
&gt;&gt;<br>
&gt;&gt; is there a good wiki / doc that explains what each of this thing i=
s:<br>
&gt;&gt; OE vs poky vs yocto vs arago?<br>
&gt;<br>
&gt; Some of that is explained above. I can go into more details offline, i=
f you<br>
&gt; wish.<br>
&gt;<br>
&gt;<br>
&gt;&gt; is that wrong to expect to be able to build a poky image by combin=
ing<br>
&gt;&gt; meta-ti and poky.git?<br>
&gt;<br>
&gt; Absolutely not! And I've been building that combination among other th=
ings -<br>
&gt; either core-image-minimal or core-image-sato.<br>
&gt;<br>
&gt;<br>
&gt;&gt; &gt; Same applies to a 'vanilla' yocto image, which does not exist=
. It would rather<br>
&gt;&gt; &gt; be useful to specify which exact image for which MACHINE you =
are trying to<br>
&gt;&gt; &gt; build. A little bit more detail is always helpful...<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; And now to the resolution part. I see you already used BBMASK=
 as prescribed in<br>
&gt;&gt; &gt; the README, since you get past the unset LICENSE error... The=
 below error<br>
&gt;&gt; &gt; happens when you build for a MACHINE that is overshadowed by =
another BSP<br>
&gt;&gt; &gt; layer that does not define MACHINE_KERNEL_PR. This MACHINE_KE=
RNEL_PR variable<br>
&gt;&gt; &gt; is set in MACHINE definitions of meta-ti BSP layer and then u=
sed in other<br>
&gt;&gt; &gt; recipes within meta-ti and different layers.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; In other words, you are trying to build for &quot;beagleboard=
&quot; machine, which gets<br>
&gt;&gt; &gt; also defined by meta-yocto-bsp layer, besides meta-ti. The so=
lution is simple -<br>
&gt;&gt; &gt; you need to move meta-ti above meta-yocto-bsp in your bblayer=
s.conf or just<br>
&gt;&gt; &gt; remove meta-yocto-bsp from the list, if you are not planning =
on building any<br>
&gt;&gt; &gt; of the reference platforms. That way you'll get the machine d=
efinition from<br>
&gt;&gt; &gt; meta-ti layer and not from meta-yocto-bsp.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; After that, core-image-minimal and some other images should b=
uild fine. Good<br>
&gt;&gt; &gt; luck!<br>
&gt;&gt;<br>
&gt;&gt; ok, so based on the feedback, i have moved poky.git to denzil bran=
ch,<br>
&gt;&gt; and meta-ti to denzil branch too. is that expected to be a good<br=
>
&gt;&gt; combination?<br>
&gt;<br>
&gt; Depends on which direction you go. Denzil branch is usually considered=
 more<br>
&gt; stable than master, although master is now feature-frozen for stabiliz=
ation<br>
&gt; before the next release. Unless you start mixing meta-oe and step on t=
o<br>
&gt; systemd issues, as systemd in denzil is not that clean. Anyway, for a =
simple<br>
&gt; poky&#43;meta-ti combination and images from meta/ directory it should=
 be fine.<br>
&gt;<br>
&gt;<br>
&gt;&gt; my build has restarted fine... i will check the build when they co=
mplete.<br>
&gt;<br>
&gt; Let us know. Like I said, I've been building both core-image-minimal a=
nd<br>
&gt; core-image-sato w/o problems before.<br>
<br>
using denzil branch on both poky.git and meta-ti, i was able to<br>
generate a poky/sato image for beagle. thx.<br>
<br>
so what if I want to use poky.git master? is there a meta-ti branch<br>
that works in this case? I think this is what i tried initially (which<br>
triggered that email) which didn't work.<br>
<br>
<br>
&gt;<br>
&gt; --<br>
&gt; Denys<br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E630DAFDLEE09entticom_--
