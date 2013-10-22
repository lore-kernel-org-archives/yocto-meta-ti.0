Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 780EDE0172B
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 10:18:31 -0700 (PDT)
Received: by mail-ea0-f171.google.com with SMTP id n15so4378526ead.16
	for <meta-ti@yoctoproject.org>; Tue, 22 Oct 2013 10:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Rw0qERhcluvD5xqYhbrRNThJX5DMwsCjsxHk51HKjAs=;
	b=TJZJOTJV5A9uBO9HLCtpa59ZwNjr1/kPPuZSHaSKRjGV5PeIpn4NyG5WgsrzavQcwd
	JZtOTcakgR8rAIh/kUtgggnhjm/FaYOdfE29lGhuq1b9aN8q1npjs6ld/5gyX94QNbCo
	vdkdZB90jaK+a7r5ZCEHhHlSxgQDRO1mN0Hdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Rw0qERhcluvD5xqYhbrRNThJX5DMwsCjsxHk51HKjAs=;
	b=ax9eYatg8jEEvAPrBDxY6g88RBZI+pgmriWucR6PA+kYRx1kDVSrieiIqo3GJC0MdR
	qvSBfdfLhjTkCvRR8XxhYpOiwOc3+/SjgQm49HcqBFxSKrL2xjeWJYB1HdQdQ0ifkwIQ
	0ovZVFN8lTqBhys+ZavHZWf02eiRmQyvpqG+LXFVURdFtxVOm0SnX4pEokUTeDuS6cOf
	+4sV+e+Uy+DxUBQwS/s8AJrM/awmiG47rA/dnCaV2K3AJu1PLBfmFqi5w29ZuF738gYL
	dhMp+I6od1Po6Xi8WGFYw2epoOaiJmkpUe2VtGH3DsCt8ASiMOWhOK/TjVdCr5HieUXU
	neXA==
X-Gm-Message-State: ALoCoQlH59nCdXTdnC06Llks+pKq26HSuUCq+WhEoPmeYXWD6Fwj0H4nuzPMmgR5wzPlsdb/DPgU
MIME-Version: 1.0
X-Received: by 10.14.107.133 with SMTP id o5mr372613eeg.110.1382462309933;
	Tue, 22 Oct 2013 10:18:29 -0700 (PDT)
Received: by 10.223.147.133 with HTTP; Tue, 22 Oct 2013 10:18:29 -0700 (PDT)
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF5C3@USNYGRMBX4.raymondcorp.local>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622B9FF5C3@USNYGRMBX4.raymondcorp.local>
Date: Tue, 22 Oct 2013 18:18:29 +0100
Message-ID: <CA+gsK-pNkDYCcecOftuopRu9XnxK3Xr9ZbSU23yekqQEczCYeg@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: AM335x-SK kernel panic with Poky(master), meta-ti(master) core-image-base
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
X-List-Received-Date: Tue, 22 Oct 2013 17:18:33 -0000
Content-Type: multipart/alternative; boundary=001a11c2a068e634a504e95796a4

--001a11c2a068e634a504e95796a4
Content-Type: text/plain; charset=ISO-8859-1

Hi Josh,

I am seeing the exact same problem with my am335x-evmsk and the latest
meta-ti with 3.12-rc5 kernel. I posted it on this mailing list [1].

This problem looks like the one posted here [2].

The bad news is I don't have a solution for it. The good news is that Denys
and I are attending the same conference and I keep harassing him about it.
:)

Cheers,
Rudi


[1]
https://lists.yoctoproject.org/pipermail/meta-ti/2013-October/003519.html
[2] http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044


On Tue, Oct 22, 2013 at 5:28 PM, Vanderpool Josh <
Joshua.Vanderpool@raymondcorp.com> wrote:

> I am having a similar issue as Rudi.
> Attached is the bootLog.
>
>
> Build Configuration:
> BB_VERSION        = "1.21.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-12.04"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.5+snapshot-20131022"
> TUNE_FEATURES     = "armv7a vfp neon"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto        = "master:505114c13d29799a25379f7ce720d632616d8776"
> meta-ti           = "master:c11504664990f007c3903d349e7cc135a904f8e2"
> meta-qt5          = "master:84cd4be2491895b0c3a0af64e4c83d58910d1f6c"
>
> Josh Vanderpool
> Electrical Engineer
> Control Systems
> The Raymond Corporation
> 20 South Canal Street
> Greene, New York 13778-0130
> Phone: 607-656-2617
> Fax: 607-656-4845
> joshua.vanderpool@raymondcorp.com
> http://www.raymondcorp.com
>
>
> Confidentiality Notice:
>
> The preceding e-mail message (including any attachments) contains
> information that may be confidential, protected by applicable legal
> privileges, or constitute non-public information. It is intended to be
> conveyed only to the designated recipient(s). If you are not an intended
> recipient of this message, please notify the sender by replying to this
> message and then delete it from your system. Use, dissemination,
> distribution or reproduction of this message by unintended recipients is
> not authorized and may be unlawful.
>
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--001a11c2a068e634a504e95796a4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Josh,<div><br></div><div>I am seeing the exact same pro=
blem with my am335x-evmsk and the latest meta-ti with 3.12-rc5 kernel. I po=
sted it on this mailing list [1].</div><div><br></div><div>This problem loo=
ks like the one posted here [2].</div>
<div><br></div><div>The bad news is I don&#39;t have a solution for it. The=
 good news is that Denys and I are attending the same conference and I keep=
 harassing him about it. :)</div><div><br></div><div>Cheers,</div><div>
Rudi</div><div><br></div><div><br></div><div>[1]=A0<a href=3D"https://lists=
.yoctoproject.org/pipermail/meta-ti/2013-October/003519.html">https://lists=
.yoctoproject.org/pipermail/meta-ti/2013-October/003519.html</a></div><div>
[2]=A0<a href=3D"http://permalink.gmane.org/gmane.linux.ports.arm.omap/9604=
4">http://permalink.gmane.org/gmane.linux.ports.arm.omap/96044</a></div><di=
v class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, Oct 22, =
2013 at 5:28 PM, Vanderpool Josh <span dir=3D"ltr">&lt;<a href=3D"mailto:Jo=
shua.Vanderpool@raymondcorp.com" target=3D"_blank">Joshua.Vanderpool@raymon=
dcorp.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">I am having a similar issue as Rudi.<br>
Attached is the bootLog.<br>
<br>
<br>
Build Configuration:<br>
BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.21.0&quot;<br>
BUILD_SYS =A0 =A0 =A0 =A0 =3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING =A0 =3D &quot;Ubuntu-12.04&quot;<br>
TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;arm-poky-linux-gnueabi&quot;<br>
MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;am335x-evm&quot;<br>
DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;<br>
DISTRO_VERSION =A0 =A0=3D &quot;1.5+snapshot-20131022&quot;<br>
TUNE_FEATURES =A0 =A0 =3D &quot;armv7a vfp neon&quot;<br>
TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;vfp-neon&quot;<br>
meta<br>
meta-yocto =A0 =A0 =A0 =A0=3D &quot;master:505114c13d29799a25379f7ce720d632=
616d8776&quot;<br>
meta-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;master:c11504664990f007c3903d349e7cc1=
35a904f8e2&quot;<br>
meta-qt5 =A0 =A0 =A0 =A0 =A0=3D &quot;master:84cd4be2491895b0c3a0af64e4c83d=
58910d1f6c&quot;<br>
<br>
Josh Vanderpool<br>
Electrical Engineer<br>
Control Systems<br>
The Raymond Corporation<br>
20 South Canal Street<br>
Greene, New York 13778-0130<br>
Phone: 607-656-2617<br>
Fax: 607-656-4845<br>
<a href=3D"mailto:joshua.vanderpool@raymondcorp.com">joshua.vanderpool@raym=
ondcorp.com</a><br>
<a href=3D"http://www.raymondcorp.com" target=3D"_blank">http://www.raymond=
corp.com</a><br>
<br>
<br>
Confidentiality Notice:<br>
<br>
The preceding e-mail message (including any attachments) contains informati=
on that may be confidential, protected by applicable legal privileges, or c=
onstitute non-public information. It is intended to be conveyed only to the=
 designated recipient(s). If you are not an intended recipient of this mess=
age, please notify the sender by replying to this message and then delete i=
t from your system. Use, dissemination, distribution or reproduction of thi=
s message by unintended recipients is<br>

not authorized and may be unlawful.<br>
<br>
<br>
<br>_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br></blockquote></div><br>
</div></div>

--001a11c2a068e634a504e95796a4--
