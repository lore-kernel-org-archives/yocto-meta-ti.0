Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
 by mx.groups.io with SMTP id smtpd.web09.4596.1623223153495234369
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 00:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: h08.hostsharing.net, ip: 176.9.242.62, mailfrom: foo00@h08.hostsharing.net)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 278BA100D9417;
	Wed,  9 Jun 2021 09:19:10 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id EB52738D64C; Wed,  9 Jun 2021 09:19:09 +0200 (CEST)
Date: Wed, 9 Jun 2021 09:19:09 +0200
From: "Lukas Wunner" <lukas@wunner.de>
To: praneeth@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH] linux-ti-staging: Update 5.10 kernel to the latest commit SHA
Message-ID: <20210609071909.GA18559@wunner.de>
References: <20210608000254.12042-1-praneeth@ti.com>
 <20210608000254.12042-2-praneeth@ti.com>
 <20210608140436.GA6013@wunner.de>
 <ea5b4665-09fe-285c-7fdd-2447b610216a@ti.com>
MIME-Version: 1.0
In-Reply-To: <ea5b4665-09fe-285c-7fdd-2447b610216a@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 08, 2021 at 07:40:07PM -0500, praneeth via lists.yoctoproject.org wrote:
> On 6/8/21 9:04 AM, Lukas Wunner wrote:
> > This doesn't apply cleanly to any of the dunfell, dunfell-next nor master
> > branches.  SRCREV is currently 8fbd16658d11 and d85aee3e19aa, respectively
> > on those branches.
> > 
> > Which branch did you base this patch on?
> 
> The patch was made based on dunfell-next.
> The conflict is seen because dunfell-next is not in sync with dunfell yet.
> Once the following patches are pulled to dunfell branch, the patch can be
> applied cleanly. I am sending a v2 shortly.
> 
> Ref:
> 2de2c5ec linux-ti-staging: Update 5.10 kernel to the latest commit SHA
> 6983b50e linux-ti-staging: Update 5.10 kernel to 5.10.35

It looks like dunfell-next wasn't pushed to git.ti.com, hence when I
fetched yesterday afternoon, the above-quoted commits were missing on
the branch:

$ cat .git/logs/refs/remotes/origin/dunfell-next
542456ca082de7133a61be21222d13974a87e41d f0abcc93b2bd272f2fc3a6ecc13f44f9658e1217 Lukas Wunner <lukas@wunner.de> 1620636780 +0200	pull --rebase: fast-forward
f0abcc93b2bd272f2fc3a6ecc13f44f9658e1217 99cf543ee385677589edc6bd132068c5a710803f Lukas Wunner <lukas@wunner.de> 1623076459 +0200	pull --rebase: fast-forward

$ date -j -f%s 1623076459
Mo  7 Jun 2021 16:34:19 CEST

But in the meantime the branch was pushed, so I've now
fetched the missing commits.

Thanks!

Lukas
