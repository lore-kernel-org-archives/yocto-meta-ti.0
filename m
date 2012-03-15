Return-Path: <ebutera@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45933E00596
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 10:36:01 -0700 (PDT)
Received: by wibhm17 with SMTP id hm17so8496461wib.11
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=gI/zPTYnQ285zPg65FPpNV8UV2wV7BGp1PYodt9Ncv8=;
	b=YAXTtSOEDW7P3o0ySAzRuQtRKZTl7YsYXUDspp9AbKF4MTlUdIarEtr/1I5R+luLn7
	VhpjHmOY7mDTxhFCxRJAFJ+OgRSIMz5AJTCkvBDwFFj6y3mSlCglqgtK8Fd+O0BRcHxM
	+jhDFzCS+3Bxl+i07Fp60ykePjCUSv8SnRwDjtuqyrXP2Xka8NFi8Z7mNyKLvmlLbjzx
	1ShpFy5LlJPKtBY8bppZdsL8ppB5G0iJWbu9IUBLkioLV7FuwwmfqfNNXtFQA0c6NUA1
	xdTlc8LOZgu5QtLwuuSt42qMy7k+AiT3woEeTuQbhmJ9qal4ZqXqqYwnv0PTpmZ4Mcuq
	TH3g==
MIME-Version: 1.0
Received: by 10.52.76.164 with SMTP id l4mr5216886vdw.6.1331832959789; Thu, 15
	Mar 2012 10:35:59 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.157.70 with HTTP; Thu, 15 Mar 2012 10:35:59 -0700 (PDT)
In-Reply-To: <1331544485-5050-1-git-send-email-schnitzeltony@googlemail.com>
References: <1331544485-5050-1-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 15 Mar 2012 18:35:59 +0100
X-Google-Sender-Auth: YZqZZJ9lzMTiH51fwW5MPEJIJwE
Message-ID: <CA+2YH7tFcGQiu_1ND0XNiDeJPwTKnzyfUa5Z0_1xY0R9kBsXGQ@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-eula-unpack: throw error message in case 32bit-glibc is missing
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
X-List-Received-Date: Thu, 15 Mar 2012 17:36:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2012 at 10:28 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> TI installation tool requires 32bit glibc [1]
>
> [1] https://lists.yoctoproject.org/pipermail/meta-ti/2012-January/000357.=
html
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
> =A0recipes-ti/includes/ti-eula-unpack.inc | =A0 =A08 ++++++++
> =A01 files changed, 8 insertions(+), 0 deletions(-)

I think it causes this error on a 32bit kubuntu 11.10:

NOTE: package ti-xdctools-3_23_00_32-r0: task do_unpack: Started
ERROR: Function failed:
TI installer requires 32bit glibc libraries for proper operation
        run 'yum install glibc.i686' on Fedora or 'apt-get install
ia32-libs' on Ubuntu/Debian
ERROR: Logfile of failure stored in: /stuff/setup-scripts-new/.....
Log data follows:
| NOTE: Unpacking /stuff/setup-scripts-new/....
| NOTE: Unpacking /stuff/setup-scripts-new/...
| ERROR: Function failed:
| TI installer requires 32bit glibc libraries for proper operation
|       run 'yum install glibc.i686' on Fedora or 'apt-get install
ia32-libs' on Ubuntu/Debian
NOTE: package ti-xdctools-3_23_00_32-r0: task do_unpack: Failed
ERROR: Task 3587
(/stuff/setup-scripts-new/sources/meta-ti/recipes-ti/devtools/ti-xdctools_3=
.23.00.32.bb,
do_unpack) failed with exit code '1'

Maybe the problem is that in my system libc is:

/lib/i386-linux-gnu/libc.so.6 -> libc-2.13.so

I know 32bit host is not officially supported (if i remember
correctly) but since the problem is only there it would be nice to
keep it working.

Enrico

