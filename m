Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D12F2E00524; Fri,  6 Jan 2017 02:22:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.bimmermann[at]yahoo.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.82.97.139 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [212.82.97.139 listed in dnsbl.sorbs.net]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm36-vm7.bullet.mail.ir2.yahoo.com
	(nm36-vm7.bullet.mail.ir2.yahoo.com [212.82.97.139])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E272CE0049A
	for <meta-ti@yoctoproject.org>; Fri,  6 Jan 2017 02:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1483698148; bh=jDRh6Yed2t0xnM/HxcTjGlXvF8pgD4ImJiU7cWeT4LM=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From:Subject;
	b=q+838Fx3sdQZFqGAT0eU4smPbsUku7o/huHfe+wWfj424Y9VMDZFauatyZ8Z3eq/pnNVcJQTfqh2gorwJQdPHoWzEuXvpWzJ1Ut2o/vDY/3PMoonRnzGwHshHQme9nij9jw25aKiyvMIFDhQTp9MiJxYJssZbqOSiny1zkh2HC+QYpT05dB3v0XSWOEwIFTe/5ZsmWtsNLMbUl00hgBttPKIQfizygWIoTl5d7LDkHnypsssdtmNpd2jroBntic8v/eL/L632pjPuyYLsAd8IrRLupnDHgc7MwQNFhnOm1t4Ph/8hmASF0+MLhjoNpsDiHGyu76dxuMrjSLiQylz+w==
Received: from [212.82.98.48] by nm36.bullet.mail.ir2.yahoo.com with NNFMP;
	06 Jan 2017 10:22:28 -0000
Received: from [46.228.39.93] by tm1.bullet.mail.ir2.yahoo.com with NNFMP;
	06 Jan 2017 10:22:27 -0000
Received: from [127.0.0.1] by smtp130.mail.ir2.yahoo.com with NNFMP;
	06 Jan 2017 10:21:45 -0000
X-Yahoo-Newman-Id: 120943.15746.bm@smtp130.mail.ir2.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: Q8PlcPIVM1nHG7MlP5fAjybKzzeUdt0bPCxnalfAvQ4Klbj
	Ez897rhUW9_qiAOwXC2TA8IaQ4DKo0A45vTmZeS16XB_iJpLvJewxH8nW5M5
	ENzTjHjtZU7lFswzrjPYbw4J4eDhEIHby1PictTNwUY9fvKWnYPUKMNCp.tc
	kLpPwKtxhf0rvUoDxLss7Qu5ueB5RKOwLPYDrdrPZpbfDUepj7IByAR7e2JN
	4L1tc6YqgVNkJzXht3zVttAUBdPoJR4vruPVzVzm6JVtxzirL39GyTnK.Z_I
	jGHh8TSqpV7ut8CVwKoR2v1kJp8giY3LNZBG4.8g51p3CVM.DyCNZjM5SxjB
	.cqZmnncWVulGE3HHMZjEzs3rf7yITwu9vy90qXNxgzkRQ_tBkqI8X_zx5Pq
	rzGEvx0jQI3KKY4j2OU0imlu1QAk2F9u.8yaeM9BaEOMU_Nkf6Pmx_2RztB2
	w9rOL8nXAETciwKN0Bk83SnNXS5ygXFFAk89fSPRSJkIycAVSgbh7p1iwUk4
	hTjzIG1u9eExpMzuTw2qVzpsccGec4YjtDg5tFo2Mb2Stic8Fun3SHoGNLJD
	lCZp6coc5JItbrGU.EZjb5.p7FhRONg--
X-Yahoo-SMTP: QRtRgFiswBDPIjAPyRh4GXvXyYhlMyXtnw--
To: Denys Dmytriyenko <denys@ti.com>, "Ruei, Eric" <e-ruei1@ti.com>
References: <972676697.10149692.1483518767462.ref@mail.yahoo.com>
	<972676697.10149692.1483518767462@mail.yahoo.com>
	<20170104171954.GG28380@edge>
	<009C030982313E4589C6BC55FBF1E82A2532EF30@DFLE09.ent.ti.com>
	<20170104181212.GI28380@edge>
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
Message-ID: <fddac173-68bc-668a-e7f0-d784f6eadd63@yahoo.de>
Date: Fri, 6 Jan 2017 11:21:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170104181212.GI28380@edge>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: ti-sgx-ddk-um / do_install failed / cp: cannot stat './targetfs//etc/*': No such file or directory
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
X-List-Received-Date: Fri, 06 Jan 2017 10:22:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi, all:

I have now successfully builded my Image. But I must change :

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb 
b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index b7fd572..6c00e6a 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -69,6 +69,7 @@ RDEPENDS_${PN} += "${PN}-plugins"
  ALLOW_EMPTY_${PN}-plugins = "1"

  INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
  INHIBIT_SYSROOT_STRIP = "1"

  INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"

Maybe you should ad this.

Thanks a lot,
Benjamin


Am 04.01.2017 um 19:12 schrieb Denys Dmytriyenko:
> On Wed, Jan 04, 2017 at 12:54:07PM -0500, Ruei, Eric wrote:
>> Hi, All:
>>
>> I try beaglebone and it does work.
>> MACHINE=beaglebone bitbake ti-sgx-ddk-um
>>
>> Best regards,
> Eric,
>
> You are not using Poky, so you won't see this problem.
>
>
> Benjamin,
>
> You should either change your MACHINE from "beaglebone" to "am335x-evm" (which
> is pretty much the same, a bit more generic), or you make sure you don't have
> meta-yocto-bsp layer in your bblayers.conf.
>


