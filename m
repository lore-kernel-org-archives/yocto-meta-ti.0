Return-Path: <dadleyy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D1DC6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 16:43:28 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.17401.1678985005175635934
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Mar 2023 09:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lwB/pFWP;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: dadleyy@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id u32so2642598ybi.6
        for <meta-ti@lists.yoctoproject.org>; Thu, 16 Mar 2023 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678985004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/BX9mVEEwCRap3z+p+U5o9MUKO5hjI3KJIx4mcni4fw=;
        b=lwB/pFWP/EaX57DvHh94ndmof4o52SmoMU8MwKMafeSY2YuIhv2CBqP9TKQ46TJQkE
         T89DvGN14JjmF/EUDzF+vfYJr05TEJ+siNVFWKPevmrbgDF6OdZuooIAwMd91wqb2s4T
         Ybfa9jtCKXo0578QuatkCHQh2ibVeto2cIVv09ipFXnWtBck8YLM5XDXotu6zWjzrEam
         CSWzM+WzYbfzA8Ipv7EPwI2OV4aRMkd3Hn+MEKvKRuFunWQG2wrrEmRqjcin0iTHeEyr
         4NOSN30IURBcigRxmUvxdRe/CNT3HdboW/4uQYD7Tjw+0EPGjqHo+1JDAZc2HkZc5Yxv
         0CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678985004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BX9mVEEwCRap3z+p+U5o9MUKO5hjI3KJIx4mcni4fw=;
        b=Q/I0lPEXUTCe3C1NV+I4bdQheeUrORMOCCzMoWmLaOl4gXsoRILdfIXUwdwnyJisZX
         JM6Sy+dE0gaw0lcL8uwF3r9UnoNtOzRkvPpLUaa4gnEMIWG649FsmEVqJICt46I3LZls
         5/6s49G0uaUuvlu/UCYYlCt2GDXI5SKHkh7y19kiKwLJSghQyjNBzLrxZCXF8A2drQ+a
         3BKwUTfuZ77IEjiEOum4yqjzvz/mTWGdjlJgH0AH4MrbrOXZAiptfOsMF0RGAKaLPFl9
         9A0BeeZRHn2+qnH0FF4EqHZ80SLmHxk8BYwOQd+NDj2crjlnZpaebIhbzNRUFfHdDmlp
         ox0Q==
X-Gm-Message-State: AO0yUKW5/wwsIVykvDXnB+Dm036mfKvlYH069Qg7YIuqet9OUasVYrZN
	l6mOFE0i4h1Eu821wzWIZDrXuS1CJEWTF/ytBPM=
X-Google-Smtp-Source: AK7set+q/DELuFU2korPkipUc0S48/WToRIIaRVODxdG/m6reXm3LOG3MS5Ng0VOxDYxyeK8/ARhTGm1fqMRtIC5j+U=
X-Received: by 2002:a5b:83:0:b0:a17:c04e:bf7c with SMTP id b3-20020a5b0083000000b00a17c04ebf7cmr28387308ybp.11.1678985004240;
 Thu, 16 Mar 2023 09:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <mail.64133faf.3771.17352b0439bf0805@storage.wm.amazon.com>
 <01000186eb30c93b-a7c4db25-4de8-4324-a052-ad225c14fdc9-000000@email.amazonses.com>
 <c77d1089-21ee-7054-7a5f-ee9934828d39@ti.com> <20230316163445.GC18050@denix.org>
In-Reply-To: <20230316163445.GC18050@denix.org>
From: Danny <dadleyy@gmail.com>
Date: Thu, 16 Mar 2023 12:43:13 -0400
Message-ID: <CADEQF5H-7MLBBms9FR-=PtBqHKmMOhrVpzgXftPPR8OdJ9iB3A@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] mesa compilation failures when setting
 PREFERRED_PROVIDER for virtual/gpudriver = "ti-sgx-ddk-km"
To: Denys Dmytriyenko <denis@denix.org>
Cc: reatmon@ti.com, danny@sizethreestudios.com, 
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Content-Type: multipart/alternative; boundary="000000000000c2d59d05f7072818"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Mar 2023 16:43:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15991

--000000000000c2d59d05f7072818
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood, thank you both for the speedy replies!

On Thu, Mar 16, 2023 at 12:35=E2=80=AFPM Denys Dmytriyenko <denis@denix.org=
> wrote:

> On Thu, Mar 16, 2023 at 11:28:47AM -0500, Ryan Eatmon via
> lists.yoctoproject.org wrote:
> >
> > The idea behind that patch series is to rework how we incorporate
> > the GPU drivers with the various software pacakges.  So, yes, that
> > will be how you will include the SGX stuff.
> >
> > But...  There was another patch that rolled back the SGX support to
> > just software rendering because we have not had the time to complete
> > the work on fxiing the SGX drivers to work with the new integration
> > methodology.
>
>
> https://git.yoctoproject.org/meta-ti/commit/?id=3Dd859c8c0916c8eb4b88ca8e=
0db7f9e5a846ba869
>
>
> > So what you are trying to do, will not currently work in
> > kirkstone/master until we finish the work to update the SGX code.
> >
> > The only real option if you require the SGX GPU to work is to
> > fallback to dunfell.
> >
> >
> > On 3/16/2023 11:11, Danny Hadley via lists.yoctoproject.org wrote:
> > >Hi all! I am trying to make sure my opengl-backed GUI application
> > >is leveraging the most optimal graphics drivers on the beaglebone
> > >black device and am running into yocto build failures.
> > >
> > >Based on what I can tell from the changes in 56be461 (
> https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-graphics/=
libgles/ti-sgx-ddk-um_1.17.4948957.bb?h=3Dkirkstone&id=3D56be4618abdde45649=
f0f92d383d5f44e5ec6efb),
> <
> https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-graphics/=
libgles/ti-sgx-ddk-um_1.17.4948957.bb?h=3Dkirkstone&id=3D56be4618abdde45649=
f0f92d383d5f44e5ec6efb
> ),> I
> > >should be able to have mesa compiled using the drivers provided
> > >from the `ti-sgx-ddk-km` recipe by setting my preferred provider
> > >for the `virtual/gpudriver` as such:
> > >
> > >```
> > >
> > >PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"
> > >
> > >```
> > >
> > >I'm not sure if this is the correct way to go about what I am
> > >trying to do, or if it is even necessary to ensure my application
> > >is using the best hardware it can (which is ultimately the goal).
> > >Either way, with the variable mentioned above set to
> > >`ti-sgx-ddk-km`, the mesa.do_compile step fails with what I
> > >believe are linker errors. This is an example of what I am seeing
> > >in my logs:
> > >
> > >```
> > >
> >
> >/<my-path-to-yocto>/tmp/work/beaglebone-poky-linux-gnueabi/mesa/2_22.0.3=
+pvr-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/=
arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/ld:
> src/gallium/frontends/sgx/libsgx.a.p/pvrdri.c.o: in function
> `PVRDRIReleaseBuffer':
> > >2023-03-15T19:19:43.7831698Z |
> /usr/src/debug/mesa/2_22.0.3+pvr-r0/build/../git/src/gallium/frontends/sg=
x/pvrdri.c:1055:
> > >undefined reference to `PVRDRIBufferDestroy'
> > >2023-03-15T19:19:43.7832402Z |
> /<my-path-to-yocto>/tmp/work/beaglebone-poky-linux-gnueabi/mesa/2_22.0.3+=
pvr-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/a=
rm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/ld:
> > >src/gallium/frontends/sgx/libsgx.a.p/pvrdri.c.o: in function
> > >`PVRDRIAllocateBuffer':
> > >2023-03-15T19:19:43.7833062Z |
> /usr/src/debug/mesa/2_22.0.3+pvr-r0/build/../git/src/gallium/frontends/sg=
x/pvrdri.c:1027:
> > >undefined reference to `PVRDRIBufferCreate'
> > >2023-03-15T19:19:43.7833813Z |
> /<my-path-to-yocto>/tmp/work/beaglebone-poky-linux-gnueabi/mesa/2_22.0.3+=
pvr-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/a=
rm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/ld:
> /usr/src/debug/mesa/2_22.0.3+pvr-r0/build/../git/src/gallium/frontends/sg=
x/pvrdri.c:1037:
> > >undefined reference to `PVRDRIBufferGetName'
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15990):
> https://lists.yoctoproject.org/g/meta-ti/message/15990
> Mute This Topic: https://lists.yoctoproject.org/mt/97653905/7450809
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-ti/leave/12019981/7450809/146462036=
7/xyzzy
> [dadleyy@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c2d59d05f7072818
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Understood, thank you both for the speedy replies!</div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Mar 16, 2023 at 12:35=E2=80=AFPM Denys Dmytriyenko &lt;<a href=3D"mailto:de=
nis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Thu, Mar 16, 2023 at 11:28:47AM -0500, Rya=
n Eatmon via <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; <br>
&gt; The idea behind that patch series is to rework how we incorporate<br>
&gt; the GPU drivers with the various software pacakges.=C2=A0 So, yes, tha=
t<br>
&gt; will be how you will include the SGX stuff.<br>
&gt; <br>
&gt; But...=C2=A0 There was another patch that rolled back the SGX support =
to<br>
&gt; just software rendering because we have not had the time to complete<b=
r>
&gt; the work on fxiing the SGX drivers to work with the new integration<br=
>
&gt; methodology.<br>
<br>
<a href=3D"https://git.yoctoproject.org/meta-ti/commit/?id=3Dd859c8c0916c8e=
b4b88ca8e0db7f9e5a846ba869" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.yoctoproject.org/meta-ti/commit/?id=3Dd859c8c0916c8eb4b88ca8e0db7f9e5a846=
ba869</a><br>
<br>
<br>
&gt; So what you are trying to do, will not currently work in<br>
&gt; kirkstone/master until we finish the work to update the SGX code.<br>
&gt; <br>
&gt; The only real option if you require the SGX GPU to work is to<br>
&gt; fallback to dunfell.<br>
&gt; <br>
&gt; <br>
&gt; On 3/16/2023 11:11, Danny Hadley via <a href=3D"http://lists.yoctoproj=
ect.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wr=
ote:<br>
&gt; &gt;Hi all! I am trying to make sure my opengl-backed GUI application<=
br>
&gt; &gt;is leveraging the most optimal graphics drivers on the beaglebone<=
br>
&gt; &gt;black device and am running into yocto build failures.<br>
&gt; &gt;<br>
&gt; &gt;Based on what I can tell from the changes in 56be461=C2=A0(<a href=
=3D"https://git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-graphic=
s/libgles/ti-sgx-ddk-um_1.17.4948957.bb?h=3Dkirkstone&amp;id=3D56be4618abdd=
e45649f0f92d383d5f44e5ec6efb" rel=3D"noreferrer" target=3D"_blank">https://=
git.yoctoproject.org/meta-ti/commit/meta-ti-bsp/recipes-graphics/libgles/ti=
-sgx-ddk-um_1.17.4948957.bb?h=3Dkirkstone&amp;id=3D56be4618abdde45649f0f92d=
383d5f44e5ec6efb</a>), &lt;<a href=3D"https://git.yoctoproject.org/meta-ti/=
commit/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb?h=
=3Dkirkstone&amp;id=3D56be4618abdde45649f0f92d383d5f44e5ec6efb" rel=3D"nore=
ferrer" target=3D"_blank">https://git.yoctoproject.org/meta-ti/commit/meta-=
ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb?h=3Dkirkstone=
&amp;id=3D56be4618abdde45649f0f92d383d5f44e5ec6efb</a>),&gt;=C2=A0I<br>
&gt; &gt;should be able to have mesa compiled using the drivers provided<br=
>
&gt; &gt;from the `ti-sgx-ddk-km` recipe by setting my preferred provider<b=
r>
&gt; &gt;for the `virtual/gpudriver` as such:<br>
&gt; &gt;<br>
&gt; &gt;```<br>
&gt; &gt;<br>
&gt; &gt;PREFERRED_PROVIDER_virtual/gpudriver =3D &quot;ti-sgx-ddk-km&quot;=
<br>
&gt; &gt;<br>
&gt; &gt;```<br>
&gt; &gt;<br>
&gt; &gt;I&#39;m not sure if this is the correct way to go about what I am<=
br>
&gt; &gt;trying to do, or if it is even necessary to ensure my application<=
br>
&gt; &gt;is using the=C2=A0best hardware it can (which is ultimately the go=
al).<br>
&gt; &gt;Either way, with the variable mentioned above set to<br>
&gt; &gt;`ti-sgx-ddk-km`, the mesa.do_compile step fails with what I<br>
&gt; &gt;believe are linker errors. This is an example of what I am seeing<=
br>
&gt; &gt;in my logs:<br>
&gt; &gt;<br>
&gt; &gt;```<br>
&gt; &gt;<br>
&gt; &gt;/&lt;my-path-to-yocto&gt;/tmp/work/beaglebone-poky-linux-gnueabi/m=
esa/2_22.0.3+pvr-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/..=
/../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/11.3.0/ld: sr=
c/gallium/frontends/sgx/libsgx.a.p/pvrdri.c.o: in function `PVRDRIReleaseBu=
ffer&#39;:<br>
&gt; &gt;2023-03-15T19:19:43.7831698Z | /usr/src/debug/mesa/2_22.0.3+pvr-r0=
/build/../git/src/gallium/frontends/sgx/pvrdri.c:1055:<br>
&gt; &gt;undefined reference to `PVRDRIBufferDestroy&#39;<br>
&gt; &gt;2023-03-15T19:19:43.7832402Z | /&lt;my-path-to-yocto&gt;/tmp/work/=
beaglebone-poky-linux-gnueabi/mesa/2_22.0.3+pvr-r0/recipe-sysroot-native/us=
r/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-p=
oky-linux-gnueabi/11.3.0/ld:<br>
&gt; &gt;src/gallium/frontends/sgx/libsgx.a.p/pvrdri.c.o: in function<br>
&gt; &gt;`PVRDRIAllocateBuffer&#39;:<br>
&gt; &gt;2023-03-15T19:19:43.7833062Z | /usr/src/debug/mesa/2_22.0.3+pvr-r0=
/build/../git/src/gallium/frontends/sgx/pvrdri.c:1027:<br>
&gt; &gt;undefined reference to `PVRDRIBufferCreate&#39;<br>
&gt; &gt;2023-03-15T19:19:43.7833813Z | /&lt;my-path-to-yocto&gt;/tmp/work/=
beaglebone-poky-linux-gnueabi/mesa/2_22.0.3+pvr-r0/recipe-sysroot-native/us=
r/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-p=
oky-linux-gnueabi/11.3.0/ld: /usr/src/debug/mesa/2_22.0.3+pvr-r0/build/../g=
it/src/gallium/frontends/sgx/pvrdri.c:1037:<br>
&gt; &gt;undefined reference to `PVRDRIBufferGetName&#39;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15990): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/15990" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/15990</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97653905/7450=
809" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/97653905/7450809</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/leave/1201=
9981/7450809/1464620367/xyzzy" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.yoctoproject.org/g/meta-ti/leave/12019981/7450809/1464620367/xyzzy</=
a> [<a href=3D"mailto:dadleyy@gmail.com" target=3D"_blank">dadleyy@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c2d59d05f7072818--

