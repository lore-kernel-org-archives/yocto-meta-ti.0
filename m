Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFE21E01407
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  1 Mar 2012 05:37:05 -0800 (PST)
Received: by wico1 with SMTP id o1so143353wic.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 01 Mar 2012 05:37:04 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.100.228 as permitted sender)
	client-ip=10.180.100.228; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.100.228 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.100.228])
	by 10.180.100.228 with SMTP id fb4mr10961776wib.1.1330609024956
	(num_hops = 1); Thu, 01 Mar 2012 05:37:04 -0800 (PST)
Received: by 10.180.100.228 with SMTP id fb4mr8786169wib.1.1330609024865;
	Thu, 01 Mar 2012 05:37:04 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s8sm41829724wiz.8.2012.03.01.05.37.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 05:37:03 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1012F047178@DLEE12.ent.ti.com>
Date: Thu, 1 Mar 2012 14:37:02 +0100
Message-Id: <2EA89E7A-F40C-4A9C-B386-5619BF0989E0@dominion.thruhere.net>
References: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F046F8B@DLEE12.ent.ti.com>
	<6D001A61-BBF4-4826-BA21-0C4F639CC31B@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F047178@DLEE12.ent.ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnm8ZXpeXXuek/JjQaI0AEyX5u2SxbhC7fbc84iIRTgVOEzPAW/Eug+ezNizuzm4Zab3ch+
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH 0/3] beagleboard.org board updates
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
X-List-Received-Date: Thu, 01 Mar 2012 13:37:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 1 mrt. 2012, om 14:29 heeft Maupin, Chase het volgende geschreven:

>=20
>> -----Original Message-----
>> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
>> Sent: Thursday, March 01, 2012 7:01 AM
>> To: Maupin, Chase
>> Cc: meta-ti@lists.yoctoproject.org
>> Subject: Re: [meta-ti] [PATCH 0/3] beagleboard.org board updates
>>=20
>>=20
>> Op 1 mrt. 2012, om 13:44 heeft Maupin, Chase het volgende
>> geschreven:
>>=20
>>> Koen,
>>>=20
>>> Why "add" the two patches from the PSP tree for linux-ti33x-psp
>> recipe?  Shouldn't those be picked up by changing the base that you
>> are pulling from.  i.e. bumping the SRCREV of the base PSP tree?
>>=20
>> I can't, the hwmod fixes for the ADC drivers break our sysfs
>> interface hack.
>=20
> Is there a plan to fix this going forward?

Devicetree...

>  I doubt we can avoid updating the base kernel forever.

I know, I'm hoping we can fix it before an update is needed. The current =
SRCREV corresponds with a psp release, so we should be reasonably safe.

>  Plus, when we switch our SDKs to using oe-core we will be updating =
the base kernel.

I hope that is a few weeks out :)

regards,

Koen=

