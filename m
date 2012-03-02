Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDC18E003E4
	for <meta-ti@yoctoproject.org>; Fri,  2 Mar 2012 06:58:14 -0800 (PST)
Received: by wibhq7 with SMTP id hq7so194309wib.35
	for <meta-ti@yoctoproject.org>; Fri, 02 Mar 2012 06:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.136.157 as permitted sender)
	client-ip=10.216.136.157; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.136.157 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.136.157])
	by 10.216.136.157 with SMTP id w29mr1528301wei.23.1330700293567
	(num_hops = 1); Fri, 02 Mar 2012 06:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=yuuMb/CUUfJCXMl4+X8DTFmAE3ZEymVSMgwF7K+FPk4=;
	b=YO0NNSG5pvpsOS36fcgBEYJmREPCDpyc9t6/+hC54MWDZC5RMuhuJuMRXc6rMPncQy
	40vl6P+GU15LEHwvb4FpuOjW9ATyFBYAGEwGqfYzi4PQPdW7f5unQFeSlROFa2L4x0p/
	D67InmyDuWDZeyXsTJE35sqEKydw0XchP3y165TsVVU55MW+V9BUlv9yLXIBfJR8Qgfy
	3GBRNc+naoua3WEnbY9BIwIEtQnJ5rkzdMRck2imHvCq7oKZ8NkfVZ9qii/t7fW6Rk+i
	81z5ktYZJxH4YftTaYmH1TPATnVGpJmy7rAeDCgLsQg4ZgqmPJK7U+SlDVm76GsoUuc8
	+eyg==
Received: by 10.216.136.157 with SMTP id w29mr1218576wei.23.1330700293458;
	Fri, 02 Mar 2012 06:58:13 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h19sm4020535wiw.9.2012.03.02.06.58.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 06:58:12 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120301212837.C08F852A8A@arago-project.org>
Date: Fri, 2 Mar 2012 15:58:10 +0100
Message-Id: <50999BC3-EC35-4F51-BD1E-9F35FD9AD78C@dominion.thruhere.net>
References: <20120301212837.C08F852A8A@arago-project.org>
To: Chase Maupin <chase.maupin@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkeXfVlEnQx4zRgjuXnigrT9sd3PosQhxwdJGX5Ht98Hdb9KmuWzl/ijvDbEp0PNIL5F+zZ
Cc: meta-ti@yoctoproject.org
Subject: Re: Chase Maupin : linux-ti33x-psp: add am335x-evm support
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
X-List-Received-Date: Fri, 02 Mar 2012 14:58:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 mrt. 2012, om 22:28 heeft Arago Project git het volgende =
geschreven:

> Module: meta-ti
> Branch: master
> Commit: 8172b803e73126c2e336050d43251538bdc4d09b
> URL:    =
http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3D8172b803e73126c2e3=
36050d43251538bdc4d09b
>=20
> Author: Chase Maupin <Chase.Maupin@ti.com>
> Date:   Tue Feb 28 17:28:14 2012 -0600
>=20
> linux-ti33x-psp: add am335x-evm support
>=20
> * Added a defconfig file for the am335x-evm and moved the common
>  configs directory from the beaglebone directory to the top
>  of the kernel files tree.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
> .../linux/linux-ti33x-psp-3.2/am335x-evm/defconfig | 2640 =
++++++++++++++++++++
> .../{beaglebone =3D> }/configs/empty                 |    0
> 2 files changed, 2640 insertions(+), 0 deletions(-)

As Gary points out, this breaks the beaglebone kernel build

regards,

Koen=

