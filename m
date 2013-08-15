Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB430E0144E
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:32:41 -0700 (PDT)
Received: by mail-oa0-f41.google.com with SMTP id j6so1335625oag.28
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=x7+hj+DhPeaIqkHQWLNpZhKRAvuimPUJVrtdpPxch1I=;
	b=upyfQ34cjEdvrgstqOr3aWgbykvrF9b0uaEdpkaGwiFLaPQZ31XVFHNWWb40EwV5aX
	LHyKzJBkH5MnKYfSL21MBU5DSENmI8bi7M4AKX7VN6X5f+udrdHU9wK4mtEO12/PhEiT
	mDHyMKQVfzDrcl2VPBUTECvYpn+p+ZLQxAO8ih8LfIKuFD//0pOSx/Y94hiCbAeYt0Ge
	Vuh+DPduXBCdGJi3QfuMADokXlT0cFRC/hcODZsqpq9Y4ZNkh4fmP7Fonn3EHxCPw9F5
	7hC1duACv+p+Z37HwEZCpVxA7GBp5o2P50FkOlad/UOtjT/WROA31+oUsR3yis8rWg34
	z9MA==
MIME-Version: 1.0
X-Received: by 10.182.242.11 with SMTP id wm11mr27613949obc.26.1376595160778; 
	Thu, 15 Aug 2013 12:32:40 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 15 Aug 2013 12:32:40 -0700 (PDT)
In-Reply-To: <20130815192249.GH2190@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CABcZANkNbqisKRLHTGmRSs=mbR4VBg2TqfV+CJp54R3G2eNUng@mail.gmail.com>
	<CAFZh4h8eAULbEJPVeMtA51gQK293bUEKPGpMxtmX2Z8kJSgJJA@mail.gmail.com>
	<20130815192249.GH2190@edge>
Date: Thu, 15 Aug 2013 15:32:40 -0400
Message-ID: <CAFZh4h-GJn1NH13+ObJk2Wxn3rXAXwTAmzOaJBfTrYTfKnDQyQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Chris Larson <clarson@kergoth.com>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 15 Aug 2013 19:32:43 -0000
Content-Type: multipart/alternative; boundary=e89a8ff24ead8ecc0904e4018900

--e89a8ff24ead8ecc0904e4018900
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 15, 2013 at 3:22 PM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> Have you tried poking into the following repositories for a possible fix:
>
>
> http://arago-project.org/git/projects/?p=linux-omap3.git;a=shortlog;h=refs/heads/ti81xx-master
> http://arago-project.org/git/projects/?p=linux-dvr-rdk-dm81xx.git;a=summary
>
> http://arago-project.org/git/projects/?p=linux-ipnc-rdk-dm81xx.git;a=summary
>
> There are some product-specific forks around TI81x which I don't have any
> visibility into and hence I can't support it in meta-ti... :(
>
>
No, I've not looked specifically thought those but I did go back and look
through some of my Arago & Angstrom OE Classic builds and log files to see
what switches where being used to build the kernel.  Tried several
combinations but they didn't appear to matter.  Maybe with Steve's fix and
the -mno-unaligned-access option I read about I can get farther.

Thanks for the suggestion.  I'll have to scan those commits to see if
anything jumps out at me.

Regards,

Brian

--e89a8ff24ead8ecc0904e4018900
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 15, 2013 at 3:22 PM, Denys Dmytriyenko <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.c=
om</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex">
<div class=3D""><div class=3D"h5"><br>
</div></div>Have you tried poking into the following repositories for a pos=
sible fix:<br>
<br>
<a href=3D"http://arago-project.org/git/projects/?p=3Dlinux-omap3.git;a=3Ds=
hortlog;h=3Drefs/heads/ti81xx-master" target=3D"_blank">http://arago-projec=
t.org/git/projects/?p=3Dlinux-omap3.git;a=3Dshortlog;h=3Drefs/heads/ti81xx-=
master</a><br>

<a href=3D"http://arago-project.org/git/projects/?p=3Dlinux-dvr-rdk-dm81xx.=
git;a=3Dsummary" target=3D"_blank">http://arago-project.org/git/projects/?p=
=3Dlinux-dvr-rdk-dm81xx.git;a=3Dsummary</a><br>
<a href=3D"http://arago-project.org/git/projects/?p=3Dlinux-ipnc-rdk-dm81xx=
.git;a=3Dsummary" target=3D"_blank">http://arago-project.org/git/projects/?=
p=3Dlinux-ipnc-rdk-dm81xx.git;a=3Dsummary</a><br>
<br>
There are some product-specific forks around TI81x which I don&#39;t have a=
ny<br>
visibility into and hence I can&#39;t support it in meta-ti... :(<br><span =
class=3D""><font color=3D"#888888"><br></font></span></blockquote><div><br>=
</div><div>No, I&#39;ve not looked specifically thought those but I did go =
back and look through some of my Arago &amp; Angstrom OE Classic builds and=
 log files to see what switches where being used to build the kernel. =A0Tr=
ied several combinations but they didn&#39;t appear to matter. =A0Maybe wit=
h Steve&#39;s fix and the=A0<span style=3D"color:rgb(0,0,0);white-space:pre=
-wrap">-mno-unaligned-access option I read about I can get farther.</span><=
/div>
<div><br></div><div>Thanks for the suggestion. =A0I&#39;ll have to scan tho=
se commits to see if anything jumps out at me.</div><div><br></div><div>Reg=
ards,</div><div><br></div><div>Brian=A0</div></div><br></div></div>

--e89a8ff24ead8ecc0904e4018900--
