Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5729.1616051329227013032
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Mar 2021 00:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8997A40BE9;
	Thu, 18 Mar 2021 07:08:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tiXfuANFo5A; Thu, 18 Mar 2021 07:08:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6F84340BA7;
	Thu, 18 Mar 2021 07:08:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2ED2F174553; Thu, 18 Mar 2021 03:08:47 -0400 (EDT)
Date: Thu, 18 Mar 2021 03:08:47 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: doxygen recipe duplicate in meta-ti
Message-ID: <20210318070847.GV18041@denix.org>
References: <CAMKF1som3yQ-6B7yzvdv-hHCyJF9h1VxnUoY0oTLpLfMdjYuKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1som3yQ-6B7yzvdv-hHCyJF9h1VxnUoY0oTLpLfMdjYuKg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2021 at 10:55:30PM -0700, Khem Raj wrote:
> Hi
> 
> I am seeing this
> 
> doxygen:
>   meta-oe              1.8.20
>   meta-ti              1.8.9.1
> 
> And meta-ti wins because it has higher layer priority, which is not a good thing
> can we use the version from meta-oe and delete it from meta-ti ?

I would hate meta-ti to depend on meta-oe, which is rather backwards. I with 
doxygen was part of oe-core...

On the other hand, usage of doxygen in meta-ti is not that critical and may 
get reduced even further soon.

-- 
Denys
