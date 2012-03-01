Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56F9CE01407
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  1 Mar 2012 05:54:56 -0800 (PST)
Received: by werm13 with SMTP id m13so430222wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 01 Mar 2012 05:54:55 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.24.166 as permitted sender)
	client-ip=10.180.24.166; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.24.166 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.24.166])
	by 10.180.24.166 with SMTP id v6mr2629851wif.10.1330610095461 (num_hops
	= 1); Thu, 01 Mar 2012 05:54:55 -0800 (PST)
Received: by 10.180.24.166 with SMTP id v6mr2104370wif.10.1330610095380;
	Thu, 01 Mar 2012 05:54:55 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	fq10sm17279661wib.11.2012.03.01.05.54.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 05:54:54 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1012F0471F8@DLEE12.ent.ti.com>
Date: Thu, 1 Mar 2012 14:54:53 +0100
Message-Id: <91B3D88B-3378-475D-A993-918B1793441E@dominion.thruhere.net>
References: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F046F8B@DLEE12.ent.ti.com>
	<6D001A61-BBF4-4826-BA21-0C4F639CC31B@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F047178@DLEE12.ent.ti.com>
	<2EA89E7A-F40C-4A9C-B386-5619BF0989E0@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012F0471F8@DLEE12.ent.ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnn40TkfC6Y56COfDdbM82n4AP+3d0QGETfOy0emdNgFugCxWFzg+DtOfCOxsKiaL8HBe8B
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
X-List-Received-Date: Thu, 01 Mar 2012 13:54:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 1 mrt. 2012, om 14:41 heeft Maupin, Chase het volgende geschreven:

>=20
>> -----Original Message-----
>> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
>> Sent: Thursday, March 01, 2012 7:37 AM
>> To: Maupin, Chase
>> Cc: meta-ti@lists.yoctoproject.org
>> Subject: Re: [meta-ti] [PATCH 0/3] beagleboard.org board updates
>>=20
>>=20
>> Op 1 mrt. 2012, om 14:29 heeft Maupin, Chase het volgende
>> geschreven:
>>=20
>>>=20
>>>> -----Original Message-----
>>>> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
>>>> Sent: Thursday, March 01, 2012 7:01 AM
>>>> To: Maupin, Chase
>>>> Cc: meta-ti@lists.yoctoproject.org
>>>> Subject: Re: [meta-ti] [PATCH 0/3] beagleboard.org board updates
>>>>=20
>>>>=20
>>>> Op 1 mrt. 2012, om 13:44 heeft Maupin, Chase het volgende
>>>> geschreven:
>>>>=20
>>>>> Koen,
>>>>>=20
>>>>> Why "add" the two patches from the PSP tree for linux-ti33x-psp
>>>> recipe?  Shouldn't those be picked up by changing the base that
>> you
>>>> are pulling from.  i.e. bumping the SRCREV of the base PSP tree?
>>>>=20
>>>> I can't, the hwmod fixes for the ADC drivers break our sysfs
>>>> interface hack.
>>>=20
>>> Is there a plan to fix this going forward?
>>=20
>> Devicetree...
>>=20
>>> I doubt we can avoid updating the base kernel forever.
>>=20
>> I know, I'm hoping we can fix it before an update is needed. The
>> current SRCREV corresponds with a psp release, so we should be
>> reasonably safe.
>=20
> True, but there is a release coming at the end of the month.  Just =
FYI.

In the extreme case I can add 4 reverts for the TSC stuff, but I really =
don't want to go there. The new code is a big step forward.

>=20
>>>=20
>>> Plus, when we switch our SDKs to using oe-core we will be
>> updating the base kernel.
>>=20
>> I hope that is a few weeks out :)
>=20
> Until I get time to work on it then yes, it is several weeks out :).  =
But you may want some of the changes in the next PSP release for PM.

Do I get access to that super-secret M3 firmware needed for proper PM as =
well? And will I be able to rebuild that with the cgt/arm toolchain? =
Right now enabling CONFIG_SUSPEND will block the boot for 60 seconds =
timing out on the m3 firmware.

regards,

Koen=

