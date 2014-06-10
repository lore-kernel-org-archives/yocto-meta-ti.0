Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F00D8E00BE1; Tue, 10 Jun 2014 16:05:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ashcharles[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.128.180 listed in list.dnswl.org]
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B009AE00B83
	for <meta-ti@yoctoproject.org>; Tue, 10 Jun 2014 16:05:15 -0700 (PDT)
Received: by mail-ve0-f180.google.com with SMTP id jw12so6388875veb.11
	for <meta-ti@yoctoproject.org>; Tue, 10 Jun 2014 16:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=H2uBY7OcX0TzfY8+TnwtPsfiGaTn/4dWV9ZUjWfeyf8=;
	b=kjBycxSK+CVBBV1wvuq473kPIO2mgaJ0MiCS/LZ/DfcQLYFw1H4hfwKBINc9/F/6q1
	BFhXiSxAFmKrBvA9+0vT1j+cCJU/5bFIuschowY8zotVFXBGPHfG6mDESwCJ0Jws1LTi
	1kDdX0Vvty64ZGkmnWuyNlm3RhHTLTPgii4nn1Bc9wSC+FyGtyZ7hK/01NYQ/Uwc9nvM
	yrK8WbRGEGTf0O9fGRR/HKYACODTq4sIM16BBwGocGnNJPxvy1rQjBJ1b204rxIg6dPd
	iUalD++/assjJE5qRBog8Z19RKW9EBG9V1xBbKZCwzvcnEFq3wCLhNl6TXD5LzfFbkv4
	zqXQ==
X-Received: by 10.58.29.198 with SMTP id m6mr34950791veh.15.1402441514411;
	Tue, 10 Jun 2014 16:05:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.198.163 with HTTP; Tue, 10 Jun 2014 16:04:43 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 10 Jun 2014 16:04:43 -0700
Message-ID: <CAK8F28kqBnnWBgdk3TXHqBLVW25sVchmQ-eUVf5ujbh=6Dcwtw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: DSP packages for OMAP3
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
X-List-Received-Date: Tue, 10 Jun 2014 23:05:28 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I was stepping through the meta-ti layer to assess support for the DSP
on OMAP3[57].

Two questions:
1.  It looks like there are more recent versions of the code
generation tools [1] (either 7.6.0 or 7.4.8) than 7.2.7.  Is there any
reason not to use these newer version? (Apologies if this is a dumb
question---I just don't know enough about the DSP ecosystem)

2. It seems like ti-dsplink and ti-linuxutils (among others I suspect)
have hardcoded compiler paths and flags that supersede those provided
by bitbake.  This is causing me headaches when trying to build with a
hardfp compiler (as recent SGX binaries are provided in hardfp mode).
Is there a technical limitation to compiling DSP support code with a
hard float compiler?  I don't mind taking a stab at making the
makefiles a little more flexible but if the code itself relies on
non-hardfp, I'll need to rethink.

Thanks for any advice,
--Ash

[1] http://software-dl.ti.com/codegen/non-esd/downloads/download.htm

