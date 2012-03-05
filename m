Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6771AE01373
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 09:15:58 -0800 (PST)
Received: by wgbdq13 with SMTP id dq13so3445187wgb.11
	for <meta-ti@yoctoproject.org>; Mon, 05 Mar 2012 09:15:57 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.95.34 as permitted sender)
	client-ip=10.180.95.34; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.95.34 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.95.34])
	by 10.180.95.34 with SMTP id dh2mr16802794wib.15.1330967757315
	(num_hops = 1); Mon, 05 Mar 2012 09:15:57 -0800 (PST)
Received: by 10.180.95.34 with SMTP id dh2mr13346211wib.15.1330967757257;
	Mon, 05 Mar 2012 09:15:57 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm64803944wib.4.2012.03.05.09.15.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 09:15:56 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <alpine.DEB.2.02.1203051212100.15878@oneiric>
Date: Mon, 5 Mar 2012 18:15:54 +0100
Message-Id: <AD1E46F4-9CEA-4FBA-AB1C-255FCD2E258A@dominion.thruhere.net>
References: <3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
	<4F4BB801.3090108@ti.com>
	<EF446FF9DAC93B479C74AB9153DE173F0C154A32@SMUCM08V.europe.bmw.corp>
	<329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
	<EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
	<EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203050730440.30632@oneiric>
	<EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203051138060.14598@oneiric>
	<4F54ED21.9000208@mlbassoc.com> <20120305165844.GE14417@denix.org>
	<alpine.DEB.2.02.1203051212100.15878@oneiric>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmQZIkQ3iY8lHPsAR2pqbUh0mKo8E4P/bNF6+DrdQhPiQIrovvcdQDi2eBGsXqFoBXt5jtL
Subject: Re: Building Yocto for Pandaboard
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
X-List-Received-Date: Mon, 05 Mar 2012 17:15:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 mrt. 2012, om 18:13 heeft Robert P. J. Day het volgende geschreven:

> On Mon, 5 Mar 2012, Denys Dmytriyenko wrote:
>=20
>> On Mon, Mar 05, 2012 at 09:43:13AM -0700, Gary Thomas wrote:
>>> On 2012-03-05 09:39, Robert P. J. Day wrote:
>>>> On Mon, 5 Mar 2012, Christian.Schulenberg@bmw.de wrote:
>>>>=20
>>>>> Hi,
>>>>>=20
>>>>> I'm using a Pandaboard Rev A4, so it is in fact an OMAP4430 board.
>>>>>=20
>>>>> You can change to u-boot bootloader in =
/meta-ti/conf/machine/omap4430-panda.conf:
>>>>=20
>>>>  i noticed that koen just submitted a sizable patch that gets rid =
of
>>>> that conf file for the panda, and standardizes on the =
pandaboard.conf
>>>> file (at least that's what it looked like).
>>>>=20
>>>>  under the circumstances, it might be worth just waiting until that
>>>> patch works its way through the system and start testing all over
>>>> again when it hits.
>>>=20
>>> Yes, you'll also get a newer kernel (3.0.2 last I looked, not =
2.6.35)
>>=20
>> FYI, there is already 3.1 for Panda in meta-ti with -1 D_P...
>=20
>  ok, i can see the new content and i just pulled into meta-ti and
> meta-openembedded.  so, starting all over again, is there now a
> known recipe for building for the panda with a minimum of
> customziation?

Yes, use the setup-scripts mentioned in the wiki, zero customization =
needed.=

