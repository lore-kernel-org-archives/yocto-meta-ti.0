Return-Path: <koen@beagleboard.org>
Received: from mail-fx0-f48.google.com (mail-fx0-f48.google.com
	[209.85.161.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51B84E005BB
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 22:37:28 -0700 (PDT)
Received: by faap14 with SMTP id p14so1933712faa.35
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 22:37:27 -0700 (PDT)
Received: by 10.223.76.135 with SMTP id c7mr16791839fak.14.1319607447234;
	Tue, 25 Oct 2011 22:37:27 -0700 (PDT)
Received: from [10.192.5.224] ([85.13.70.251])
	by mx.google.com with ESMTPS id w7sm2074673fab.6.2011.10.25.22.37.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Oct 2011 22:37:26 -0700 (PDT)
Message-Id: <7E538E72-E56A-4BA3-88C1-C0D4BCD50132@beagleboard.org>
From: Koen Kooi <koen@beagleboard.org>
To: meta-ti@yoctoproject.org
In-Reply-To: <F61A9010E56D7F4C93A19FD36DAAC3590B9C55@DFLE34.ent.ti.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 26 Oct 2011 07:37:24 +0200
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
	<F61A9010E56D7F4C93A19FD36DAAC3590B9B9A@DFLE34.ent.ti.com>,
	<CB6184BC-17D4-43C4-8BBA-2945CD411452@dominion.thruhere.net>
	<F61A9010E56D7F4C93A19FD36DAAC3590B9C55@DFLE34.ent.ti.com>
X-Mailer: Apple Mail (2.936)
Subject: Re: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-to-serial drivers
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
X-List-Received-Date: Wed, 26 Oct 2011 05:37:28 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 26 okt 2011, om 07:27 heeft Kridner, Jason het volgende geschreven:

> Sorry for the top-post.  I've subscribed now with my  
> @beagleboard.org account as well, so after this e-mail, I should be  
> able to use a slightly better mail tool.
>
> Will udev or some other mechanism enable all of them to be loaded  
> automatically?

Standard kernel hotplug will take care of that.

