Return-Path: <tom.rini@gmail.com>
Received: from mail-qw0-f53.google.com (mail-qw0-f53.google.com
	[209.85.216.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 575F7E00306
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 30 Jan 2012 07:20:17 -0800 (PST)
Received: by qafk1 with SMTP id k1so2140463qaf.5
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 30 Jan 2012 07:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=m7M0MkA+uDw7SKa68lyPerwscNLRVKq9Thl24UXnTBc=;
	b=Xj5wGHtBTrIEmCT9Mo+1mFYWhiJA6OtAOYlaDpbS3TFXLKgeJK3uyQicM4iLKdyNr1
	lZ2lwCqTWACZ3E4MmMgflgB4KfqQLgqLE719AVUyROUU5WS9zpkZOA0SPgFKoDO9NVS9
	bTaWBOGv7YnuB2iRFbpN1dwzrKTZJo/xjZG7w=
MIME-Version: 1.0
Received: by 10.224.116.6 with SMTP id k6mr14402917qaq.91.1327936816734; Mon,
	30 Jan 2012 07:20:16 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Mon, 30 Jan 2012 07:20:16 -0800 (PST)
In-Reply-To: <074F4B92-525B-408B-8C84-E3D6CB4B151E@dominion.thruhere.net>
References: <1327845060-30614-1-git-send-email-koen@dominion.thruhere.net>
	<074F4B92-525B-408B-8C84-E3D6CB4B151E@dominion.thruhere.net>
Date: Mon, 30 Jan 2012 08:20:16 -0700
Message-ID: <CA+M6bXmGWNPF2L=zQeXh4JHPOD_=azM0H=TbU46RCHBSv1ve4g@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] u-boot 2011.12: fix beagleboard C4 memory detection
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
X-List-Received-Date: Mon, 30 Jan 2012 15:20:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 12:54 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 29 jan. 2012, om 14:51 heeft Koen Kooi het volgende geschreven:
>
>> Test results (which emberassingly enough lack an actual C4):
>>
>> BeagleBoard B6:
>>
>> =A0 =A0 =A0 OMAP3530-GP ES2.1, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mH=
z
>> =A0 =A0 =A0 OMAP3 Beagle board + LPDDR/NAND
>> =A0 =A0 =A0 I2C: =A0 ready
>> =A0 =A0 =A0 DRAM: =A0128 MiB
>> =A0 =A0 =A0 NAND: =A0256 MiB
>> =A0 =A0 =A0 [..]
>> =A0 =A0 =A0 Beagle Rev Ax/Bx
>>
>> BeagleBoard C3:
>>
>> =A0 =A0 =A0 OMAP3530-GP ES3.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mH=
z
>> =A0 =A0 =A0 OMAP3 Beagle board + LPDDR/NAND
>> =A0 =A0 =A0 I2C: =A0 ready
>> =A0 =A0 =A0 DRAM: =A0256 MiB
>> =A0 =A0 =A0 NAND: =A0256 MiB
>> =A0 =A0 =A0 [..]
>> =A0 =A0 =A0 Beagle Rev C1/C2/C3
>>
>> BeagleBoard C5:
>>
>> =A0 =A0 =A0 OMAP3530-GP ES3.1, CPU-OPP2, L3-165MHz, Max CPU Clock 720 mH=
z
>> =A0 =A0 =A0 OMAP3 Beagle board + LPDDR/NAND
>> =A0 =A0 =A0 I2C: =A0 ready
>> =A0 =A0 =A0 DRAM: =A0256 MiB
>> =A0 =A0 =A0 NAND: =A0512 MiB
>> =A0 =A0 =A0 [..]
>> =A0 =A0 =A0 Beagle Rev C4
>>
>
> And now the big question: how should these be flashed to NAND?

My sequence is:
mmc rescan 0;fatload mmc 0 82000000 MLO;nandecc hw;nand erase 0
80000;nand write 82000000 0 20000;nand write 82000000 20000 20000;nand
write 82000000 40000 20000;nand write 82000000 60000 20000;fatload mmc
0 0x80200000 u-boot.img;nand erase 80000 170000;nand write 0x80200000
80000 170000

IOW, u-boot.img now goes in with HW, not SW EC

--=20
Tom

