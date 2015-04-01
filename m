Return-Path: <whittenburg@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D143E008EA; Wed,  1 Apr 2015 12:54:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (whittenburg[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.212.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 694CEE0056E
	for <meta-ti@yoctoproject.org>; Wed,  1 Apr 2015 12:54:43 -0700 (PDT)
Received: by wibgn9 with SMTP id gn9so79961155wib.1
	for <meta-ti@yoctoproject.org>; Wed, 01 Apr 2015 12:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=Dh2lwbCyra7y4aad+wSveAZcGKTvhzvhk4yALXXlSA0=;
	b=pG1561j65Sjwjy8dBBsH3T1AfoVwSQU7np6MJG9dcd0qpRQc3zii53MdV1/cT7ACf1
	DvKCnB6i0sfPVOCiJRSnx+RWeYiYhvuCS2xN3xugmF6w13J/+hdzHZEVqZruFjCpxPfl
	j4wpzqjSSXsZhe8tqrR0T28fVmPBKpa86ug9TwF2aRqe8F+/4xzZf+LeR85/o2AWWb3g
	6GVfiPgpDxJrZ+/yMQLjCXZmYBkNkG4UtpLBFPZORN/U+uCaOLjz7yjQmTbk3/dVtEx4
	T1qxA78ndTD80cJMm4SX9V5+/3YyPzUw7zDpgPMKCEDo3vxpp4Fm7N7aRZ077He0ItgH
	nlEg==
MIME-Version: 1.0
X-Received: by 10.180.14.135 with SMTP id p7mr10273682wic.8.1427918082428;
	Wed, 01 Apr 2015 12:54:42 -0700 (PDT)
Received: by 10.27.5.21 with HTTP; Wed, 1 Apr 2015 12:54:42 -0700 (PDT)
In-Reply-To: <CABcw_OnRid8H9KYkK5tPCCG12Tzz-N0W3ZotpSa6FKBj68dXEA@mail.gmail.com>
References: <CABcw_OnRid8H9KYkK5tPCCG12Tzz-N0W3ZotpSa6FKBj68dXEA@mail.gmail.com>
Date: Wed, 1 Apr 2015 14:54:42 -0500
Message-ID: <CABcw_OmGe5ZSVpZFZSPMETZPW9dOxpZcDmDqmPuG1vQ40qVFEQ@mail.gmail.com>
From: Chris Whittenburg <whittenburg@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Re: cmem-mod building problems
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: whittenburg@gmail.com
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Apr 2015 19:54:45 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 29, 2015 at 2:46 PM, Chris Whittenburg
<whittenburg@gmail.com> wrote:
>
> I'm using using dizzy on a Gumstix Overo, and I'm trying to build the cmem
> module recipe.  I'm guessing this is the preferred method versus the
> ti-linuxutils recipe.

Still trying to get cmem going, I went back to the ti-linuxutils
recipe.  It errors out with

| /home/chris/yocto/build/tmp/sysroots/overo/usr/include/gnu/stubs.h:7:29:
fatal error: gnu/stubs-soft.h: No such file or directory
|  # include <gnu/stubs-soft.h>

Which shows that __ARM_PCS_VFP is not getting set. I think the
-mfloat-abi-hard is getting dropped somewhere.

Is there a cmem recipe in meta-ti which will work with dizzy using a
3.17 kernel?

Thanks,
Chris

