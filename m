Return-Path: <miroslav.kes@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12F4CE00576; Mon, 14 Jul 2014 08:12:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (miroslav.kes[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.44 listed in list.dnswl.org]
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FCA3E0030A
	for <meta-ti@yoctoproject.org>; Mon, 14 Jul 2014 08:12:17 -0700 (PDT)
Received: by mail-qg0-f44.google.com with SMTP id j107so3612759qga.31
	for <meta-ti@yoctoproject.org>; Mon, 14 Jul 2014 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=SgfQpdVFvS8b1V95h1Cxj1YpSBZf+77fWLGctE4YZLQ=;
	b=wwn3mCIhl51nvy/zzs5VRAwgh16dsQBA8zNzFgxYN8CXRoXGaU9xPHjBU948AeU9An
	Pk1PXqRCaJPe2XcCfkLVt63Rodq8jAd+uWDwzrrsnm5UqzDmwJtlAa1B23r9dl8e929O
	/Sagoji+ZLFql13Md7e4TCrPznEFcp/0PZ/rC5xrCgUjBF+r+95XZ+iq9p595CkLpxTR
	yc0C1VLoDdiUC3doVUjQn3DYeZYwNByu03+rnZ4aeg4BXAsxtAGaHh+CcpiP11NIlw5K
	WqbRbZK00Bvg50cwvB1E2dEbv+fhZd3sK2HgZZUg6eKkLndtOXoKe9oQafIbfivPkaln
	/gGA==
X-Received: by 10.140.48.161 with SMTP id o30mr24813412qga.68.1405350736571;
	Mon, 14 Jul 2014 08:12:16 -0700 (PDT)
Received: from [10.70.136.159] ([205.175.202.247])
	by mx.google.com with ESMTPSA id r13sm11456404qga.1.2014.07.14.08.12.14
	for <meta-ti@yoctoproject.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Jul 2014 08:12:16 -0700 (PDT)
Message-ID: <53C3F353.2020001@gmail.com>
Date: Mon, 14 Jul 2014 17:12:19 +0200
From: =?windows-1252?Q?Miroslav_Ke=9A?= <miroslav.kes@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: [daisy] missing network adapter options in omap2plus_defconfig
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
X-List-Received-Date: Mon, 14 Jul 2014 15:12:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I have successfully built and booted a distroless image for BeagleBoard using just meta-ti  and openembedded-core/meta layers (daisy branch).

Neverthelles, the kernel config pulled by meta-ti/recipes-kernel/linux/linux-mainline/defconfig refers the omap2plus_defconfig which doesn't set the
CONFIG_USB_EHCI_HCD option.

So the BeagleBoard boots OK but it doesn't see the network adapter.

I was easily able to fix it using .bbappend with the customized defconfig for beagleboard machine but it should be fixed in the daisy branch I think.

Mira




