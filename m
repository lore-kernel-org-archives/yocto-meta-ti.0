Return-Path: <christophercordahi@nanometrics.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0EFC25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 04:38:18 +0000 (UTC)
Subject: Re: Has the TI download host changed?
To: meta-ti@lists.yoctoproject.org
From: christophercordahi@nanometrics.ca
X-Originating-Location: Ottawa, Ontario, CA (192.0.135.235)
X-Originating-Platform: Linux Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 17 May 2024 21:38:14 -0700
References: <2815c4bb-51d2-42c5-8bfd-0f88bd1ce73f@ti.com>
In-Reply-To: <2815c4bb-51d2-42c5-8bfd-0f88bd1ce73f@ti.com>
Message-ID: <14282.1716007094592000211@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 18 May 2024 04:38:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17663

Thanks Ryan for confirming that the issue isn't with the Yocto recipes them=
selves.
And apologies for the two private messages I sent you.
I just realized that they weren't appearing in this group because I was mis=
takenly sending them as private messages.

Previously using software-dl.ti.com always failed while downloads.ti.com al=
ways succeeded.
I've been investigating this on and off for the past 3 days at work and at =
home; always with the same result,
Good news, is that it's now working for me.

A colleague first encountered this problem on Wednesday at work and another=
 encountered it earlier today at home.
We're all located in Ottawa, ON, Canada.
I'm using Ubuntu 22.04.4 LTS. and they're using similar but different Linux=
 distributions.

I had also tried the basic ubuntu:24.04 docker container with the same resu=
lts
docker run -it ubuntu:24.04 sh -c "apt update; apt -y install wget; wget ht=
tp://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/3_55_=
02_22/exports/xdccore/xdctools_3_55_02_22_core_linux.zip"

I was going to attach wget debug logs but it unexpectedly worked for me now=
, overwriting the log with the failure.  Ryan may still have it in his priv=
ate email.
wget -o xdctools_software-dl.log -O xdctools_software-dl.zip -d -t3 http://=
software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/3_55_02_22=
/exports/xdccore/xdctools_3_55_02_22_core_linux.zip
wget -o xdctools_downloads.log -O xdctools_downloads.zip -d http://download=
s.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/3_55_02_22/exports/x=
dccore/xdctools_3_55_02_22_core_linux.zip

Anyways, thanks Ryan and Chirag for the assistance.

