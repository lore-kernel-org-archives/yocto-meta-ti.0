Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35C1DE00547; Tue, 15 Jul 2014 11:35:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.182 listed in list.dnswl.org]
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08553E004FF
	for <meta-ti@yoctoproject.org>; Tue, 15 Jul 2014 11:35:01 -0700 (PDT)
Received: by mail-ie0-f182.google.com with SMTP id y20so4917104ier.27
	for <meta-ti@yoctoproject.org>; Tue, 15 Jul 2014 11:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=azTGjbBjzWAJkkOOF7JsbqJpwBv1tlv59BVqakuPtB0=;
	b=b9SpoQkhnA3hY62FZrSxJT7UA9bBY3BSndro4T5FPNbVJI994Y28H2/l9y9TK5co0d
	PcSKJyJzt1qflO1U8OZndlMQMwoxGMTZMhL1QIT9L6pJ0taCAqBVUO0FNMAN2zc4PjeF
	KiDsJ9fweB14ncGA1/EuNqONa8cheeWj2FmRtZ43p5GBmNSZM/a190LVzrc1YSpWAjpb
	4TVsDraoUmcNIjy9kcKh8n6PEBBYMMYI97fnzCfzVKrFyVvAAimaa/VmMvotn0s2HjZd
	1h218QlPs55KFmKaD0PDljeBAcHzHmTn8pf4f7SDQ1J3iwF7CuL0JQ0qQyYYod7v8LSK
	hCzg==
X-Received: by 10.50.43.134 with SMTP id w6mr8859772igl.17.1405449301099; Tue,
	15 Jul 2014 11:35:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Tue, 15 Jul 2014 11:34:31 -0700 (PDT)
In-Reply-To: <53C3F353.2020001@gmail.com>
References: <53C3F353.2020001@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Jul 2014 11:34:31 -0700
Message-ID: <CAMKF1sqn0wYeNHps-0Ss0zotP3cMp-u2iVC1e49Cc8o3HO4OcA@mail.gmail.com>
To: =?UTF-8?Q?Miroslav_Ke=C5=A1?= <miroslav.kes@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [daisy] missing network adapter options in omap2plus_defconfig
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
X-List-Received-Date: Tue, 15 Jul 2014 18:35:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2014 at 8:12 AM, Miroslav Ke=C5=A1 <miroslav.kes@gmail.com>=
 wrote:
>
> Neverthelles, the kernel config pulled by meta-ti/recipes-kernel/linux/li=
nux-mainline/defconfig refers the omap2plus_defconfig which doesn't set the
> CONFIG_USB_EHCI_HCD option.
>

inform or send a patch to meta-ti

