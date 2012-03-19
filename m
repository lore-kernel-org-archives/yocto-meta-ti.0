Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37D60E013A5
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2012 14:13:52 -0700 (PDT)
Received: by wibhm17 with SMTP id hm17so3947494wib.11
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2012 14:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=l8vqwHuVC/QqlYkERfW1UEIk45FzsYX+m8REJAePyls=;
	b=bwg+hvTwiN5mhgFAzKdC4wgZ28cCDYgU7RVEqJr+Azn/9MEoqYwHzZEnD2asGzhnNS
	fGQK6CuCYc2p/25RIEmDxDs9M6j6zfGs5okHfn8ZyDtIa8gWmRHo/5LwWdJvnzzgjKb7
	FKWr3T2slvzQ0krBypyx4hQoQdX6J1fC+o9es9YKMF0oaHLjqUXZonu3qLBOFG6U4PT8
	yeZYrDOsBvoCN4JwCnCqkyg/KnwN1WFMnfw2Tep5/T2lu3BY2tTAeY7sAj4IwliDw+AE
	a2ZvvzXIZHpwtaxGhvzUHucC6bdvk09hAo/2kuhHi2ImcGzmCRQwQE4UGUOP6SuLy8gC
	7j2A==
Received: by 10.180.79.135 with SMTP id j7mr22831122wix.19.1332191632043;
	Mon, 19 Mar 2012 14:13:52 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm17076321wib.8.2012.03.19.14.13.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 14:13:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120319210557.GF19810@bill-the-cat>
Date: Mon, 19 Mar 2012 22:13:48 +0100
Message-Id: <EC42051F-B39B-4B48-AC71-8BB88C00E297@dominion.thruhere.net>
References: <F01BAC6C-9AA4-4D59-AB9B-067A9D1E9ED7@dominion.thruhere.net>
	<20120319205854.GE19810@bill-the-cat>
	<20120319210247.GD15554@denix.org>
	<20120319210557.GF19810@bill-the-cat>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk1681OLpPxBMBUDJMyW/Nx0oPumPA2XKhVIbFsMFSht8cvPeokyy692x6xaOgP9XWixCkP
Subject: Re: release branch for meta-ti?
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
X-List-Received-Date: Mon, 19 Mar 2012 21:13:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 mrt. 2012, om 22:05 heeft Tom Rini het volgende geschreven:

> On Mon, Mar 19, 2012 at 05:02:47PM -0400, Denys Dmytriyenko wrote:
>> On Mon, Mar 19, 2012 at 01:58:54PM -0700, Tom Rini wrote:
>>> On Mon, Mar 19, 2012 at 01:58:36PM +0100, Koen Kooi wrote:
>>>> Hi,
>>>>=20
>>>> Any volunteers for maintaining a releasebranch that matches the =
upcoming oe-core release in ~4 weeks?
>>>=20
>>> If Denys or Chase don't step-up, I'll do it.  As qualification, I do
>>> such a thing for oe-classic currently :)  But if either of them =
would
>>> rather, I'll defer to them.
>>=20
>> We'll probably need to set meta-oe-maintenance up anyway for =
meta-arago to=20
>> work with, rather than chasing changes in the master...
>=20
> Yes, meta-oe will also need a maintenance release to match,

Working on that already :) That should hopefully avoid the usual arago =
forks or everything and the kitchensink.

regards,

Koen=

