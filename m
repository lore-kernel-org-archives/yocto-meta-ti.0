Return-Path: <koen@dominion.thruhere.net>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BF0DE0044D
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 15:08:56 -0700 (PDT)
Received: by pbbjt11 with SMTP id jt11so2862524pbb.35
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 15:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=zGtBEbCxayaaO50Q9EbIx+IKuOuB+vXfWEGOCbcvyls=;
	b=GsDJxWL+FjNmuTQAMkeqya7+lo5rRsVRHI8nWcgQV7FQWrH8HFxZ/4TzFOBQ0UYM08
	oFfIInJNq1zRro7b2mdT71x5nBdKRjBnAwPf48hUde1p2s7jIVgr10mP5vn4Pgk8WlW+
	Tos1EKrNyIba4KxjgSEESXYdzh3qcSG7LYXNgMpjE7tyyGVM8DmnVPVM0JU3XJUp/jZn
	uI3rOagZqR3nadocLxHr1faUP1dBe6lXQzxgt9G8dn+SQDPxCUdKj9etvLbpgr0qjDRP
	wH68q/GHX3I+biihmhUVBXp/+JP0QN87Wpki/PKdR4vSZsBK8+fri2Znv3NJhh6ZjPH8
	f46Q==
Received: by 10.68.230.104 with SMTP id sx8mr975692pbc.16.1333145336174;
	Fri, 30 Mar 2012 15:08:56 -0700 (PDT)
Received: from [10.61.32.129] ([69.38.219.78])
	by mx.google.com with ESMTPS id q5sm3685795pbp.28.2012.03.30.15.08.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 15:08:54 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120319210557.GF19810@bill-the-cat>
Date: Fri, 30 Mar 2012 15:09:00 -0700
Message-Id: <788A3D57-ACFD-4CA0-820F-0DD91DCB8196@dominion.thruhere.net>
References: <F01BAC6C-9AA4-4D59-AB9B-067A9D1E9ED7@dominion.thruhere.net>
	<20120319205854.GE19810@bill-the-cat>
	<20120319210247.GD15554@denix.org>
	<20120319210557.GF19810@bill-the-cat>
To: Tom Rini <trini@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQltIJ9m0bFAd7c2n/2F14QaWL3hdyHB2ZGzXerjxWA/fa9vfLnB3y2SfcG6hiQ6eCQVioeG
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 30 Mar 2012 22:08:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 mrt. 2012, om 14:05 heeft Tom Rini het volgende geschreven:

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
> Yes, meta-oe will also need a maintenance release to match

meta-oe branch is really close to having a maintainer, what's the =
(final) word on the meta-ti branch?

regards,

Koen


