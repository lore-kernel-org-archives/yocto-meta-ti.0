Return-Path: <dadleyy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED44EC61DA3
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 00:59:35 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.1271.1677027575311129514
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 16:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QnStyczz;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: dadleyy@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id e194so6965849ybf.1
        for <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 16:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gufx7QT4Tx1DCsVPhBAZjL9u7eQEmTOYwxyDkbtn2I=;
        b=QnStyczzOqiI0CjofZMtaWwI1Q4UU/Jk86Jz4EdPEJLJTAh6jmF5QMLFnzEC6W3R8I
         tTjhJaCj9NCgVr+d8Af5+LdEAg3VjEn9xlCFYL4xSfXwT5uL7RQVyxZtCKIvGJ7MfXy/
         ZQyVsI3wly+C7+1c3haSZ8URUBcRt8HxYy6gbatiibMehYuzofTn0FcTJyiU3RcZrQi+
         bLFzlxaMTBmEuKWJKJfqvGKbLzjxrph1GVQHI0rs1Mc2Kl5Qc/FqxvQeqZcb/SdMr9Et
         Pwk57jrZ/BjQNo29jhQhgrGgdg64mgn2cgWDIw5ajTc6z8DWej7zqHGQXGh3byOdiJzR
         YWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Gufx7QT4Tx1DCsVPhBAZjL9u7eQEmTOYwxyDkbtn2I=;
        b=hTHmrtQw0hqPe1a1sNDRnAkryw9ilZwEl+Ha2q9mAH0+ffFNE9ikeWkof2whb3nlnz
         qpM+4hrJHRkKKwdwCD17oasJ0j4NoXRtcjgKaaIy7HTO4R+wK4xKovtKKVPhQg2O/BLY
         AAcXswm8Ft9K8ZC8+gXxqDupceoNqAY3a6rfGow5Xc86w7IcNDBMBNVxi/VLyr28eaYi
         6Png6FTep0tqmKzqWl25VdziruVNh3BNyhCNULrECKvobDUGYpEvVRwjZ6vXaosDdtMu
         jX3HdwDuFtCUyjc3eZlWkptq93+xcF1DlVQiNEpZM5G8K3bSnkCx4pnYvV7Pb4l19UC/
         vNTg==
X-Gm-Message-State: AO0yUKXleOrksRvAD0VPQ4HdYnl77ar5gEhVhciUZHRm/Aj/1fmuRmqU
	lGV/50KWw9oAiCJFqgISPLKz3WbAGYQ23SKvfAE=
X-Google-Smtp-Source: AK7set95yrym2Q0rXmJ3G38j4aKc1AtJUndf4R2BhNLW6cj5OHnIYrknJ9ziB9cJjiKjWoaMKNkqW7X3I4N5zAKYyck=
X-Received: by 2002:a25:8e03:0:b0:8d5:5d9d:d088 with SMTP id
 p3-20020a258e03000000b008d55d9dd088mr256756ybl.229.1677027574060; Tue, 21 Feb
 2023 16:59:34 -0800 (PST)
MIME-Version: 1.0
References: <mail.63f2b04b.7701.250da99230589a6c@storage.wm.amazon.com>
 <010001866c00aa88-a006fdb2-93c0-408b-99ff-8ec3aac48d40-000000@email.amazonses.com>
 <CAOCHtYg6C_1sx+7ozKgZhdYkU_AwtkPyhyQKeOx_2UhXbPyOnQ@mail.gmail.com>
In-Reply-To: <CAOCHtYg6C_1sx+7ozKgZhdYkU_AwtkPyhyQKeOx_2UhXbPyOnQ@mail.gmail.com>
From: Danny <dadleyy@gmail.com>
Date: Tue, 21 Feb 2023 19:59:22 -0500
Message-ID: <CADEQF5Ecc4rD5=jXnwLOCiGt6qO2iZ+zSQrNrgtJ-4DFRuvjpA@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] trouble loading device tree overlay
 (beaglebone black, uboot, linux-ti-staging)
To: Robert Nelson <robertcnelson@gmail.com>
Cc: danny@sizethreestudios.com, 
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000d49cd705f53f68fa"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 00:59:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15900

--000000000000d49cd705f53f68fa
Content-Type: text/plain; charset="UTF-8"

Hi Robert - Thank you for the response (and apologies for double emailing)!
I have tried swapping my kernel provider to use the bb.org recipe by
setting:

```
PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
```

but after about ~5 attempts I still have not been able to successfully
fetch the repo; I am a bit worried I might be trying to fetch too large of
an amount of data. I believe the relevant logs from my build system are:

```
git -c core.fsyncobjectfiles=0 -c gc.autoDetach=false -c core.pager=cat
clone --bare --mirror https://git.beagleboard.org/beagleboard/linux.git
git.beagleboard.org.beagleboard.linux.git --progress failed with exit code
128, no output
```

yocto aside, trying to clone via

```
git clone https://git.beagleboard.org/beagleboard/linux.git
```

fails (somewhat expectedly, I think) with

```
error: 1610 bytes of body are still expected1.01 GiB | 5.65 MiB/s
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output
```

I am able to clone with `--depth 1 --no-checkout`, which I had considered
doing to make a personal mirror on github but I don't think thats the right
direction to go, or if I should be looking into some bitbake configuration
to perform some shallow clone.

Is there a correct way to go about using the `git.beaglebone.org` servers
as the source?

I did notice that you *might* be maintaining a mirror on github.com at
https://github.com/beagleboard/linux - is it safe to assume that will be
kept up to date with the sources at git.beagleboard.org? The commit
referred to by the current kirkstone branch in meta-ti (
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb?h=kirkstone)
does not exist (9b11aaf2cdb1861ca74dc69d032a0f94cdd32bd6) in the github
repo, i.e (
https://github.com/beagleboard/linux/commit/9b11aaf2cdb1861ca74dc69d032a0f94cdd32bd6
).

What is interesting is that the parent of 9b11aaf does exist in both -
49ae123d2fee3f4ed30c5359fbb3e398e898f2a9. I tried overriding the `SRC_URI`
of the linux-bb.org_git.bb recipe to be

```
SRC_URI = "git://
github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH}"
SRCREV = "49ae123d2fee3f4ed30c5359fbb3e398e898f2a9"
```

which causes bitbake to fail with

```
Fetcher failure: Unable to find revision
49ae123d2fee3f4ed30c5359fbb3e398e898f2a9 in branch 5.10
```
I had also tried using a `.tar.gz` of the source itself from the download
url provided by gitlab but wasn't sure what needed to change for that to be
accepted as a `SRC_URI` by bitbake.

As a third option I noticed that the overlays themselves seem to be kept up
to date in https://git.beagleboard.org/beagleboard/BeagleBoard-DeviceTrees;
this caught my eye because I was thinking that the existing recipe I set up
to compile and place the overlays in my boot partition from the legacy
https://github.com/beagleboard/bb.org-overlays repo works almost as-is with
a `SRC_UI` pointing to that repo.

The thinking there is that I can still use `linux-ti-staging` and the `
git.ti.com` upstream kernel sources while using the `git.beaglebone.org`
upstream as the source for my device tree overlays. Since the kernel
sources might not include all of the patches from the `git.beaglebone.org`
source, I'm skeptical if this would work, but I'm going to give it a try
now and see what happens.

Thanks again for your help!

On Tue, Feb 21, 2023 at 9:42 AM Robert Nelson <robertcnelson@gmail.com>
wrote:

>
>
> On Sun, Feb 19, 2023 at 5:27 PM Danny Hadley via lists.yoctoproject.org
> <danny=sizethreestudios.com@lists.yoctoproject.org> wrote:
>
>> Hello - I'd like to start by saying thanks gain to all for the continued
>> work on this project!
>>
>>
>>
>> I'm reaching out again for help on my beaglebone + yocto project. I feel
>> like I am really close to a functional implementation, but I am now stuck
>> on getting my LCD screen to render anything (for reference, I am using one
>> of these - https://4dsystems.com.au/4dcape-43). My hunch is that I need
>> to enable the device tree overlay for the cape.
>>
>>
>>
>> I've spend a few days poking around, and have a recipe in my yocto
>> project that compiles the overlay files from this repo -
>> https://github.com/beagleboard/bb.org-overlays.  At this point, I have a
>> bunch of compiled `.dtbo` files both being written to the
>> `DEPLOY_DIR_IMAGE` and the boot partition of my wic file which is exciting
>> (my guess is I am specifically interested in this one -
>> https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE-4D4C-01-00A1.dts)
>> <https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE-4D4C-01-00A1.dts).>
>> .
>>
>
> The separate "bb.org-overlays" should not be used outside of anything
> newer than v4.19.x based kernels. While it worked great for many years,
> just too many device-tree api changes over the years..
>
> Our 5.10.x-ti branch has direct support for the BB-BONE-4D4C-01-00A1.dts:
> https://git.beagleboard.org/beagleboard/linux/-/blob/5.10/arch/arm/boot/dts/overlays/BB-BONE-4D4C-01-00A1.dts
> , thus it's already built for this lcd.
>
> The other trick, the Black defaults to built-in hdmi..  Another board has
> shipped that's the Black without an HDMI.  "BeagleBone-Green", so in u-boot
> force fdtfile=am335x-bonegreen.dtb and apply the BB-BONE-4D4C-01-00A1.dtbo
> overlay..
>
> Regards,
>
> --
> Robert Nelson
> https://rcn-ee.com/
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15894):
> https://lists.yoctoproject.org/g/meta-ti/message/15894
> Mute This Topic: https://lists.yoctoproject.org/mt/97076057/7450809
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> dadleyy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d49cd705f53f68fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Robert - Thank you for the respon=
se (and apologies for double emailing)! I have tried swapping my kernel pro=
vider to use the <a href=3D"http://bb.org">bb.org</a> recipe by setting:</d=
iv><div><br></div><div>```</div><div><span style=3D"font-family:monospace">=
PREFERRED_PROVIDER_virtual/kernel =3D &quot;<a href=3D"http://linux-bb.org"=
>linux-bb.org</a>&quot;</span></div><div>```</div><div><br></div><div>but a=
fter about ~5 attempts I still have not been able to successfully fetch the=
 repo; I am a bit worried I might be trying to fetch too large of an amount=
 of data. I believe the relevant logs from my build system are:<br><br>```<=
/div><div><span style=3D"font-family:monospace">git -c core.fsyncobjectfile=
s=3D0 -c gc.autoDetach=3Dfalse -c core.pager=3Dcat clone --bare --mirror <a=
 href=3D"https://git.beagleboard.org/beagleboard/linux.git">https://git.bea=
gleboard.org/beagleboard/linux.git</a> git.beagleboard.org.beagleboard.linu=
x.git --progress failed with exit code 128, no output</span><br>```<br></di=
v><div><br></div><div>yocto aside, trying to clone via<br><br>```</div><div=
><span style=3D"font-family:monospace">git clone <a href=3D"https://git.bea=
gleboard.org/beagleboard/linux.git">https://git.beagleboard.org/beagleboard=
/linux.git</a></span></div><div>```</div><div><br></div><div>fails (somewha=
t expectedly, I think) with <br><br>```<br><span style=3D"font-family:monos=
pace">error: 1610 bytes of body are still expected1.01 GiB | 5.65 MiB/s =C2=
=A0 =C2=A0 <br>fetch-pack: unexpected disconnect while reading sideband pac=
ket<br>fatal: early EOF<br>fatal: fetch-pack: invalid index-pack output</sp=
an><br></div><div>```</div><div><br></div><div>I am able to clone with `--d=
epth 1 --no-checkout`, which I had considered doing to make a personal mirr=
or on github but I don&#39;t think thats the right direction to go, or if I=
 should be looking into some bitbake configuration to perform some shallow =
clone.<br></div><div><br></div><div><div>Is there a correct way to go about=
 using the `<a href=3D"http://git.beaglebone.org">git.beaglebone.org</a>` s=
ervers as the source?<br></div></div><div><br></div><div>I did notice that =
you <i>might</i> be maintaining a mirror on <a href=3D"http://github.com">g=
ithub.com</a> at <a href=3D"https://github.com/beagleboard/linux">https://g=
ithub.com/beagleboard/linux</a> - is it safe to assume that will be kept up=
 to date with the sources at <a href=3D"http://git.beagleboard.org">git.bea=
gleboard.org</a>? The commit referred to by the current kirkstone branch in=
 meta-ti (<a href=3D"https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/=
recipes-kernel/linux/linux-bb.org_git.bb?h=3Dkirkstone">https://git.yoctopr=
oject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb=
?h=3Dkirkstone</a>) does not exist (9b11aaf2cdb1861ca74dc69d032a0f94cdd32bd=
6) in the github repo, i.e (<a href=3D"https://github.com/beagleboard/linux=
/commit/9b11aaf2cdb1861ca74dc69d032a0f94cdd32bd6">https://github.com/beagle=
board/linux/commit/9b11aaf2cdb1861ca74dc69d032a0f94cdd32bd6</a>).<br><br></=
div><div>What is interesting is that the parent of 9b11aaf does exist in bo=
th - 49ae123d2fee3f4ed30c5359fbb3e398e898f2a9. I tried overriding the `SRC_=
URI` of the <a href=3D"http://linux-bb.org_git.bb">linux-bb.org_git.bb</a> =
recipe to be<br><br>```</div>SRC_URI =3D &quot;git://<a href=3D"http://gith=
ub.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${BRANCH}">github.co=
m/beagleboard/linux.git;protocol=3Dhttps;branch=3D${BRANCH}</a>&quot;<br>SR=
CREV =3D &quot;49ae123d2fee3f4ed30c5359fbb3e398e898f2a9&quot;<div>```</div>=
<div><br></div><div>which causes bitbake to fail with<br><br>```</div><div>=
Fetcher failure: Unable to find revision 49ae123d2fee3f4ed30c5359fbb3e398e8=
98f2a9 in branch 5.10</div><div>```</div><div>I had also tried using a `.ta=
r.gz` of the source itself from the download url provided by gitlab but was=
n&#39;t sure what needed to change for that to be accepted as a `SRC_URI` b=
y bitbake.</div><div><br></div><div>As a third option I noticed that the ov=
erlays themselves seem to be kept up to date in <a href=3D"https://git.beag=
leboard.org/beagleboard/BeagleBoard-DeviceTrees">https://git.beagleboard.or=
g/beagleboard/BeagleBoard-DeviceTrees</a>; this caught my eye because I was=
 thinking that the existing recipe I set up to compile and place the overla=
ys in my boot partition from the legacy <a href=3D"https://github.com/beagl=
eboard/bb.org-overlays">https://github.com/beagleboard/bb.org-overlays</a> =
repo works almost as-is with a `SRC_UI` pointing to that repo. <br></div><d=
iv><br></div><div>The thinking there is that I can still use `linux-ti-stag=
ing` and the `<a href=3D"http://git.ti.com">git.ti.com</a>` upstream kernel=
 sources while using the `<a href=3D"http://git.beaglebone.org">git.beagleb=
one.org</a>` upstream as the source for my device tree overlays. Since the =
kernel sources might not include all of the patches from the `<a href=3D"ht=
tp://git.beaglebone.org">git.beaglebone.org</a>` source, I&#39;m skeptical =
if this would work, but I&#39;m going to give it a try now and see what hap=
pens.<br></div><div><br></div><div>Thanks again for your help!<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Feb 21, 2023 at 9:42 AM Robert Nelson &lt;<a href=3D"mailto:robertcnel=
son@gmail.com">robertcnelson@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, Feb 19, 2023 at 5:27 PM Danny Hadley via <a href=3D"http://lists.y=
octoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;danny=3D<=
a href=3D"mailto:sizethreestudios.com@lists.yoctoproject.org" target=3D"_bl=
ank">sizethreestudios.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><u></u>





<div>
<div><p style=3D"margin:0px;font-family:Arial,Tahoma,Helvetica,sans-serif;f=
ont-size:small">Hello - I&#39;d like to start by saying thanks gain to all =
for the continued work on this project!</p><p style=3D"margin:0px;font-fami=
ly:Arial,Tahoma,Helvetica,sans-serif;font-size:small">=C2=A0</p><p style=3D=
"margin:0px;font-family:Arial,Tahoma,Helvetica,sans-serif;font-size:small">=
I&#39;m reaching out again for help on my beaglebone + yocto project. I fee=
l like I am really close to a functional implementation, but I am now stuck=
 on getting my LCD screen to render anything (for reference, I am using one=
 of these - <a href=3D"https://4dsystems.com.au/4dcape-43" target=3D"_blank=
">https://4dsystems.com.au/4dcape-43</a>). My hunch is that I need to enabl=
e the device tree overlay for the cape.</p><p style=3D"margin:0px;font-fami=
ly:Arial,Tahoma,Helvetica,sans-serif;font-size:small">=C2=A0</p><p style=3D=
"margin:0px;font-family:Arial,Tahoma,Helvetica,sans-serif;font-size:small">=
I&#39;ve spend a few days poking around, and have a recipe in my yocto proj=
ect that compiles the overlay files from this repo - <a href=3D"https://git=
hub.com/beagleboard/bb.org-overlays." target=3D"_blank">https://github.com/=
beagleboard/bb.org-overlays.</a>=C2=A0 At this point, I have a bunch of com=
piled `.dtbo` files both being written to the `DEPLOY_DIR_IMAGE` and the bo=
ot partition of my wic file which is exciting (my guess is I am specificall=
y interested in this one - <a href=3D"https://github.com/beagleboard/bb.org=
-overlays/blob/master/src/arm/BB-BONE-4D4C-01-00A1.dts)." target=3D"_blank"=
>https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE=
-4D4C-01-00A1.dts)</a>.=C2=A0</p></div></div></blockquote><div><br></div><d=
iv>The separate &quot;bb.org-overlays&quot; should not be used outside of a=
nything newer than v4.19.x based kernels. While it worked great for many ye=
ars, just too many device-tree api changes over the years..</div><div><br><=
/div><div>Our 5.10.x-ti branch has direct support for the=C2=A0BB-BONE-4D4C=
-01-00A1.dts:=C2=A0<a href=3D"https://git.beagleboard.org/beagleboard/linux=
/-/blob/5.10/arch/arm/boot/dts/overlays/BB-BONE-4D4C-01-00A1.dts" target=3D=
"_blank">https://git.beagleboard.org/beagleboard/linux/-/blob/5.10/arch/arm=
/boot/dts/overlays/BB-BONE-4D4C-01-00A1.dts</a> , thus it&#39;s already bui=
lt for this lcd.</div><div><br></div><div>The other trick, the Black defaul=
ts to built-in hdmi..=C2=A0 Another board has shipped that&#39;s the Black =
without an HDMI.=C2=A0 &quot;BeagleBone-Green&quot;, so in u-boot force=C2=
=A0fdtfile=3Dam335x-bonegreen.dtb and apply the=C2=A0BB-BONE-4D4C-01-00A1.d=
tbo overlay..</div><div><br></div><div>Regards,</div></div><div><br></div>-=
- <br><div dir=3D"ltr">Robert Nelson<br><a href=3D"https://rcn-ee.com/" tar=
get=3D"_blank">https://rcn-ee.com/</a></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15894): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/15894" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/15894</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97076057/7450=
809" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/97076057/7450809</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:dadleyy@gmail.com" target=3D"_blank">dadleyy@g=
mail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d49cd705f53f68fa--

