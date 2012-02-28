Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D6A4E0123C
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 28 Feb 2012 07:58:18 -0800 (PST)
Received: by wgbed3 with SMTP id ed3so2052061wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 28 Feb 2012 07:58:17 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.139.29 as permitted sender)
	client-ip=10.216.139.29; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.139.29 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.139.29])
	by 10.216.139.29 with SMTP id b29mr4154229wej.55.1330444697890
	(num_hops = 1); Tue, 28 Feb 2012 07:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=y+x6Z3Mmh0Nwd1gzqWrXv/RvjxK3i4YnhzSrojIH23w=;
	b=OdjCkCaUKoeVRNRmPBdtjW4pw7fLWnJJ2NFs64sChlc92CeXPJm83XEe80092uy14O
	fiY+aq1Z4H1Fq7fIPP13fR5aNePchm8Nn9HY+d06cQPBDW9D9JW6/ZlGKjUA1ri8Jybf
	vaRTbHRy822h+vWFJ9Vfg8tN5PbRLTH9UWHgA=
Received: by 10.216.139.29 with SMTP id b29mr3272613wej.55.1330444697792;
	Tue, 28 Feb 2012 07:58:17 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p10sm30116805wic.0.2012.02.28.07.58.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 07:58:16 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120228152205.GC10713@denix.org>
Date: Tue, 28 Feb 2012 16:58:11 +0100
Message-Id: <81A0AEEA-EB5D-4C82-ABD1-D6E05E7226F1@dominion.thruhere.net>
References: <1330442197-10408-1-git-send-email-koen@dominion.thruhere.net>
	<20120228152205.GC10713@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnuhtlqlwhbk/VgF5XlfI4B562MH7jiCOYUNA0kTr1G+gUdTHlQM8TEyj3mNoitnqxeiwzm
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] linux-davinci: quoting fixes
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
X-List-Received-Date: Tue, 28 Feb 2012 15:58:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 feb. 2012, om 16:22 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Tue, Feb 28, 2012 at 04:16:37PM +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Thanks, I've started cleaning up missing quotes in other places too.

I sent another patch to fix some more recipes, that gave up in the =
matrix dir.

>=20
> Denys
>=20
>=20
>> ---
>> recipes-kernel/linux/linux-davinci_git.bb |    8 ++++----
>> 1 files changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/recipes-kernel/linux/linux-davinci_git.bb =
b/recipes-kernel/linux/linux-davinci_git.bb
>> index 1fda1ee..e4b85d6 100644
>> --- a/recipes-kernel/linux/linux-davinci_git.bb
>> +++ b/recipes-kernel/linux/linux-davinci_git.bb
>> @@ -22,13 +22,13 @@ ARAGO_L1_BR  =3D "master"
>> ARAGO_L1_PV  =3D "2.6.32+2.6.33-rc4-${PR}+gitr${SRCREV}"
>> ARAGO_L1_URI =3D =
"git://arago-project.org/git/projects/linux-omapl1.git;protocol=3Dgit;bran=
ch=3D${BRANCH} "
>>=20
>> -SRCREV_hawkboard                  =3D ${ARAGO_L1_REV}
>> +SRCREV_hawkboard                  =3D "${ARAGO_L1_REV}"
>>=20
>> -PV_omapl138             =3D ${ARAGO_L1_PV}
>> +PV_omapl138             =3D "${ARAGO_L1_PV}"
>>=20
>> -BRANCH_omapl138         =3D ${ARAGO_L1_BR}
>> +BRANCH_omapl138         =3D "${ARAGO_L1_BR}"
>>=20
>> -SRC_URI_append_omapl138 =3D ${ARAGO_L1_URI}
>> +SRC_URI_append_omapl138 =3D "${ARAGO_L1_URI}"
>>=20
>> SRC_URI_append_omapl138 =3D " file://logo_linux_clut224.ppm \
>>                                      =
file://0001-ahci-ti-Fix-currently-harmless-typo-in-SATA-PHY.patch \
>> --=20
>> 1.7.2.5
>>=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>>=20


