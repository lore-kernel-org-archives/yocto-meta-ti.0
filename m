Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21E5FE0142E
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 01:07:51 -0700 (PDT)
Received: by vcbfl11 with SMTP id fl11so5158983vcb.35
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 01:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=EbqAM1SSPpnnLPyw7X2QfgeQLIRyupe4Bnp5gcKRYfk=;
	b=wXLRozT2ndw32K/TcM+QbuQ1QAlk/oaNR5utgbGhZtljEvJoHN4NNMllqrda/gSWsP
	iDFpUCRBYsJfthT7DwYZoQHTzY2BOuZ+bSMvW33Na+krGyQCbks4w3T+oUWQj/aP3J7l
	x9WoihlDOZuMW5L42yDIKSQeBn5eMttOZJjqfoeSsjN+/iCIFFInr9z9ALpFVh+8V1Sp
	0b6Z8j33Cd6QzEzAN5iL9qIEJbc9FghLXQPC38FbnNNtPqcQjZwi4RJsAN1EmkoBANZB
	dMACBqNClhJ2PUTPY5PGPctckg09S5uq+4nWib9570tHeq2u0+Jb50SnA8NEcjcSoIXU
	2cKw==
MIME-Version: 1.0
Received: by 10.221.0.74 with SMTP id nl10mr3925448vcb.47.1343635670037; Mon,
	30 Jul 2012 01:07:50 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.147.19 with HTTP; Mon, 30 Jul 2012 01:07:49 -0700 (PDT)
In-Reply-To: <9D64B6CF-0B94-413C-89A4-D9A55DB38AF1@nokia.com>
References: <9D64B6CF-0B94-413C-89A4-D9A55DB38AF1@nokia.com>
Date: Mon, 30 Jul 2012 10:07:49 +0200
X-Google-Sender-Auth: 2MO89K41H-fqt1iCIZ3_RCG3Vis
Message-ID: <CA+2YH7sLFSnRJ4RAUGj=V=BbGpE-3pB79sxm33O_RXCSqWC8Tw@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: joshua.marinacci@nokia.com
Cc: meta-ti@yoctoproject.org
Subject: Re: Gumstix Wifi
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 08:07:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 28, 2012 at 9:30 PM,  <joshua.marinacci@nokia.com> wrote:
> This does work. When I boot the wpa stuff is included but I still don't h=
ave a network driver loaded.  If I include the built modules-3.2.19-r0-over=
o.tgz in my rootfs I can cd into the directory with all of the modules.  Ho=
wever insmod libertas.ko fails with
>
>         insmod: can't insert 'libertas_tf_usb.ko': unknown symbol in modu=
le, or unknown parameter
>
> and modprobe fails with
>
>         modprobe: module libertas not found in modules.dep
>
>
> So, what should I do to make sure the libertas module is compiled correct=
ly, included in my kernel, and then actually used at runtime?

try with "depmod -a" (this must be done only once after you untar the
modules) before modprobe libertas.

I am not sure but i think it was "modprobe libertas_sdio", try that
too. And of course you will need the libertas firmware
(sd8686....bin).

Enrico

