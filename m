Return-Path: <ebutera@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF211E008EA; Wed,  1 Apr 2015 13:41:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC3FDE0056E
	for <meta-ti@yoctoproject.org>; Wed,  1 Apr 2015 13:41:08 -0700 (PDT)
Received: by ignm3 with SMTP id m3so38225146ign.0
	for <meta-ti@yoctoproject.org>; Wed, 01 Apr 2015 13:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=qZqPTERnLTOEepdWID+xuqWGoGCFgMDSdfVlMDchldU=;
	b=adJSxig6B8zyvYgXstKGBWEqultYNP/Stp2r/Sfx0IzuL61a11dwgxcJwVJjIKzTQs
	PpQ6zl8Z77OnP0FYnebNZUkhRqSz01h64onnXFun1IqKlT+sV7J1v2LNAp6cw2LZM7ko
	q4DPUIaSbneh2CTdY7MnTQP+nnXH+H3+PXNxHLFdPJhnsxPONxD26Dm31wYTziobHWKT
	lzF3TQaRrFJAwzszCTifwctbvABSeinI02cdHhv0HYTSF8OgNY1ZKhDUF6zCt2HRhEL0
	qgAgaLVGImwpXCfgjvJL1mdKfEsYwPGdA/ridEMSd4hQtuPSqwDa0dxIFeozI93AnqFP
	ZFkQ==
MIME-Version: 1.0
X-Received: by 10.107.135.75 with SMTP id j72mr68085792iod.0.1427920868383;
	Wed, 01 Apr 2015 13:41:08 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.36.101.133 with HTTP; Wed, 1 Apr 2015 13:41:08 -0700 (PDT)
In-Reply-To: <CABcw_OmGe5ZSVpZFZSPMETZPW9dOxpZcDmDqmPuG1vQ40qVFEQ@mail.gmail.com>
References: <CABcw_OnRid8H9KYkK5tPCCG12Tzz-N0W3ZotpSa6FKBj68dXEA@mail.gmail.com>
	<CABcw_OmGe5ZSVpZFZSPMETZPW9dOxpZcDmDqmPuG1vQ40qVFEQ@mail.gmail.com>
Date: Wed, 1 Apr 2015 22:41:08 +0200
X-Google-Sender-Auth: gLQ38XY7YR1HONIYTO1w9okiPH4
Message-ID: <CA+2YH7tspT2d_j9DcmB9jvp3NFDOSxfq61xAekNrJ6Nao8nvGA@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Chris Whittenburg <whittenburg@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: cmem-mod building problems
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
X-List-Received-Date: Wed, 01 Apr 2015 20:41:14 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 1, 2015 at 9:54 PM, Chris Whittenburg <whittenburg@gmail.com> wrote:
> On Sun, Mar 29, 2015 at 2:46 PM, Chris Whittenburg
> <whittenburg@gmail.com> wrote:
>>
>> I'm using using dizzy on a Gumstix Overo, and I'm trying to build the cmem
>> module recipe.  I'm guessing this is the preferred method versus the
>> ti-linuxutils recipe.
>
> Still trying to get cmem going, I went back to the ti-linuxutils
> recipe.  It errors out with
>
> | /home/chris/yocto/build/tmp/sysroots/overo/usr/include/gnu/stubs.h:7:29:
> fatal error: gnu/stubs-soft.h: No such file or directory
> |  # include <gnu/stubs-soft.h>
>
> Which shows that __ARM_PCS_VFP is not getting set. I think the
> -mfloat-abi-hard is getting dropped somewhere.
>
> Is there a cmem recipe in meta-ti which will work with dizzy using a
> 3.17 kernel?

I could be wrong but i think nobody in TI tests the cmem recipe/module
on omap3 unfortunately, so you must use the one in linuxutils.
Actually i think it's not cmem on itself but testing it with all the
other ti recipes (gstreamer-ti etc...).

And you must use soft float in your distro if you want to use the ti
recipes on omap3 (i'm using them with kernel 3.17).

Enrico

