Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B35DE00746
	for <meta-ti@yoctoproject.org>; Sun,  4 Mar 2012 06:10:15 -0800 (PST)
Received: by wibhq7 with SMTP id hq7so1328850wib.35
	for <meta-ti@yoctoproject.org>; Sun, 04 Mar 2012 06:10:14 -0800 (PST)
Received: by 10.180.100.196 with SMTP id fa4mr8562517wib.0.1330870214202;
	Sun, 04 Mar 2012 06:10:14 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gf3sm15026339wib.6.2012.03.04.06.10.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 06:10:13 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330869346.7797.14.camel@ted>
Date: Sun, 4 Mar 2012 15:10:07 +0100
Message-Id: <03942C7A-BA91-4772-9326-FA511E97DE83@dominion.thruhere.net>
References: <4F5213E8.50108@mlbassoc.com>
	<89B59491-7BDB-4A5D-BDC0-D4E3863E417B@dominion.thruhere.net>
	<4F5367ED.1060903@mlbassoc.com>
	<7AB88097-7498-4BEE-879A-D24894A4CB36@dominion.thruhere.net>
	<4F536B67.2070009@mlbassoc.com> <1330869346.7797.14.camel@ted>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmWeQB48nhon9IxhK+FqFiDYJGlSjdvYsx+A3/BzqncbJQYye6qV4fDZCwEk0wZ80vNZTu5
Subject: Re: [Angstrom-devel] Can't build cloud9 image
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
X-List-Received-Date: Sun, 04 Mar 2012 14:10:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mrt. 2012, om 14:55 heeft Richard Purdie het volgende geschreven:

> On Sun, 2012-03-04 at 06:17 -0700, Gary Thomas wrote:
>> On 2012-03-04 06:09, Koen Kooi wrote:
>>> Op 4 mrt. 2012, om 14:02 heeft Gary Thomas het volgende geschreven:
>>>> On 2012-03-04 05:46, Koen Kooi wrote:
>>>>> Op 3 mrt. 2012, om 13:51 heeft Gary Thomas het volgende =
geschreven:
>> this so I can build the full cloud9-image?
>>>>>=20
>>>>> At the risk of responding to a practical joke: /etc/fstab entries =
need to be created with the user flag for the loop devices, the error =
message even includes the exact entry you need to add.
>>>>=20
>>>> I see that, but what if I'm "Joe user" who can't (or doesn't want =
to)
>>>> edit /etc/fstab?
>>>=20
>>> Then you can't build this image.
>>>=20
>>>>  Everything else builds with no special "root" style
>>>> privileges, why does this one image need it?
>>>=20
>>> Simply put: because the tools suck. A this point in time there is no =
tool (or tools plural) that allows creating 2 partitions (vfat and extX) =
and concatenating them into a valid image with an MBR. The biggest lack =
is something like 'genfatfs', mcopy is a step in the right direction but =
is too limited to work in this scenario.
>>> And genext2fs will likely OOM on a lot of buildmachines.
>>=20
>> But this is just to be able to generate a packed image that can be
>> copied directly to media?  Maybe that should be a different image
>> type, like the .u-boot images?  Then it would be obvious what's
>> being done and why.  In my case, I'm more than happy running a script
>> to copy the appropriate files to my SD card, etc. and I don't care
>> (nor especially want) a packed image.
>=20
> Just for reference, the directdisk stuff that was in OE-Core did
> something like this (create an MBR with a couple of partitions =
following
> it). It was removed as having some minor bugs and being unneeded but =
the
> code might prove an interesting starting point to addressing this
> problem. To come back, it would need to be a proper IMAGE_FSTYPES =
entry.

When I last tried to use that code it created images incompatible with =
the boot ROM used in TI SoCs :(

regards,

Koen=

