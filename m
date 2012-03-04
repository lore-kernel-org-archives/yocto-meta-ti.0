Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6B31E00746
	for <meta-ti@yoctoproject.org>; Sun,  4 Mar 2012 05:56:02 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q24DtvgQ026265;
	Sun, 4 Mar 2012 13:55:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25293-08; Sun,  4 Mar 2012 13:55:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q24DtgwR026258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 4 Mar 2012 13:55:48 GMT
Message-ID: <1330869346.7797.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Sun, 04 Mar 2012 05:55:46 -0800
In-Reply-To: <4F536B67.2070009@mlbassoc.com>
References: <4F5213E8.50108@mlbassoc.com>
	<89B59491-7BDB-4A5D-BDC0-D4E3863E417B@dominion.thruhere.net>
	<4F5367ED.1060903@mlbassoc.com>
	<7AB88097-7498-4BEE-879A-D24894A4CB36@dominion.thruhere.net>
	<4F536B67.2070009@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Sun, 04 Mar 2012 13:56:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-03-04 at 06:17 -0700, Gary Thomas wrote:
> On 2012-03-04 06:09, Koen Kooi wrote:
> > Op 4 mrt. 2012, om 14:02 heeft Gary Thomas het volgende geschreven:
> >> On 2012-03-04 05:46, Koen Kooi wrote:
> >>> Op 3 mrt. 2012, om 13:51 heeft Gary Thomas het volgende geschreven:
> this so I can build the full cloud9-image?
> >>>
> >>> At the risk of responding to a practical joke: /etc/fstab entries need to be created with the user flag for the loop devices, the error message even includes the exact entry you need to add.
> >>
> >> I see that, but what if I'm "Joe user" who can't (or doesn't want to)
> >> edit /etc/fstab?
> >
> > Then you can't build this image.
> >
> >>   Everything else builds with no special "root" style
> >> privileges, why does this one image need it?
> >
> > Simply put: because the tools suck. A this point in time there is no tool (or tools plural) that allows creating 2 partitions (vfat and extX) and concatenating them into a valid image with an MBR. The biggest lack is something like 'genfatfs', mcopy is a step in the right direction but is too limited to work in this scenario.
> > And genext2fs will likely OOM on a lot of buildmachines.
> 
> But this is just to be able to generate a packed image that can be
> copied directly to media?  Maybe that should be a different image
> type, like the .u-boot images?  Then it would be obvious what's
> being done and why.  In my case, I'm more than happy running a script
> to copy the appropriate files to my SD card, etc. and I don't care
> (nor especially want) a packed image.

Just for reference, the directdisk stuff that was in OE-Core did
something like this (create an MBR with a couple of partitions following
it). It was removed as having some minor bugs and being unneeded but the
code might prove an interesting starting point to addressing this
problem. To come back, it would need to be a proper IMAGE_FSTYPES entry.

Cheers,

Richard


