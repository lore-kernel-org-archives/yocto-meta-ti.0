Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 195C7E002AC
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 13:04:55 -0700 (PDT)
Received: by eekd41 with SMTP id d41so977963eek.35
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 13:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=EcQtBb/iwuK3EG3XVcNI52qn/VLKJpE+d435hAP69i8=;
	b=SZz+TG4QDQBpvakoqdzrfKnzIxh+aLA7jP3mmsWafXAxBgNa2g61KKPaBD/UuJ+S+2
	HWVd+aJbuC56Q1igI3kxAimKmoRC7A+l6JWXyuTrP3/Ar01yw1vKh2TzSjSdvIDa+dzR
	afd2/aT/tkCucBihYmAZtZ0R5Ntw0zecoLGap0Vxvai7bL3csSxLgHTA0GFzgu3/5WVk
	HhDY7oVV+3NqU45aaslbkIVxsYlNhl8AoUi3WVKv8YnZIm2ts9KAuFO4bI+4CZE7uugO
	LbJQ1V63uLoMqC0igMhad6GfqSeYO99DUNbvamT4bxHsuF+7pHMNaEpqBrTIav+1oO3w
	FpZw==
Received: by 10.14.223.9 with SMTP id u9mr8167133eep.10.1346357094793;
	Thu, 30 Aug 2012 13:04:54 -0700 (PDT)
Received: from ?IPv6:2001:610:612::45c9:4dbe:38c8:fb8c?
	([2001:610:612:0:45c9:4dbe:38c8:fb8c])
	by mx.google.com with ESMTPS id e7sm7661137eep.2.2012.08.30.13.04.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 13:04:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <503FC4F8.9020509@r-finger.com>
Date: Thu, 30 Aug 2012 22:04:52 +0200
Message-Id: <2738A779-5C39-4A97-84B0-DF6876997C5D@dominion.thruhere.net>
References: <CALjj03Wphx5VuPkPxhYXsPJL9Pu-UsuFaCfxO17LVwTm-qO+mQ@mail.gmail.com>
	<20120830174807.GB26145@edge> <503FC4F8.9020509@r-finger.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlPzEscfptlq33Z2Lh+UY1pF0v/rOSt0mXRRJ2Azf2YJJjAr34m/Xfkp2fXLNg9TtbLrR7x
Cc: meta-ti@yoctoproject.org
Subject: Re: Building a core-image-base
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 20:04:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 aug. 2012, om 21:54 heeft Tomas Frydrych =
<tf+lists.yocto@r-finger.com> het volgende geschreven:
>=20
>> Not sure what was the problem with netbase, as it's quite self =
contained. Are=20
>> you sure you are using matching branches?
>=20
> The problem is that meta-ti seems to be an endlessly moving target
> tracking the master of oe core, while people using Yocto tend to use =
its
> stable releases. meta-ti would really benefit from some formal release
> process/schedule,

You mean the 'denzil' branch that tracks denzil is not enough?!?!?!=

