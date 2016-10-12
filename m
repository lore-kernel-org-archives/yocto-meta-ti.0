Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AEC1FE00AF2; Wed, 12 Oct 2016 01:05:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98AFFE009D8
	for <meta-ti@yoctoproject.org>; Wed, 12 Oct 2016 01:05:31 -0700 (PDT)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 1FF4668A01C; Wed, 12 Oct 2016 09:05:30 +0100 (BST)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 9EDD068A019;
	Wed, 12 Oct 2016 09:05:29 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 22E0467402A3;
	Wed, 12 Oct 2016 10:05:29 +0200 (CEST)
To: meta-ti@yoctoproject.org
References: <93e07642-1cc5-40eb-ac40-2debe67d0c72@email.android.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <636aa24f-b4ec-6e8a-9c8d-68325816ba83@mlbassoc.com>
Date: Wed, 12 Oct 2016 10:05:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <93e07642-1cc5-40eb-ac40-2debe67d0c72@email.android.com>
Subject: Re: Can't build for BeagleBone
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
X-List-Received-Date: Wed, 12 Oct 2016 08:05:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-11 12:47, Denys Dmytriyenko wrote:
> Yeah, I'm also getting this in master. Works fine in krogoth. Haven't yet looked close at it though...

I've tracked it down to this function in the main Makefile not working
correctly (line 1230):
   define filechk_uboot.release
         echo "$(UBOOTVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
   endef

In the Poky/Yocto build, the $(CONFIG_SHELL) is not expanding correctly.
If I short-circuit this function, e.g.
   define filechk_uboot.release
         echo "MY VERSION"
   endef
then the build completes correctly.

I can't see what has changed in this area recently, so I'm a bit baffled.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

