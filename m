Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 496FFE006CB
	for <meta-ti@yoctoproject.org>; Fri, 25 Jan 2013 09:32:46 -0800 (PST)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PHaeoK014659; Fri, 25 Jan 2013 17:36:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id k8E-Ns87D3mS; Fri, 25 Jan 2013 17:36:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PHaYdr014651
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 25 Jan 2013 17:36:37 GMT
Message-ID: <1359135133.13917.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denys@ti.com>
Date: Fri, 25 Jan 2013 17:32:13 +0000
In-Reply-To: <20130125172057.GD23977@denix.org>
References: <alpine.DEB.2.02.1301240816240.7586@oneiric>
	<20130125172057.GD23977@denix.org>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux_3.1.bb: Remove bad line continuation.
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
X-List-Received-Date: Fri, 25 Jan 2013 17:32:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-01-25 at 12:20 -0500, Denys Dmytriyenko wrote:
> On Thu, Jan 24, 2013 at 08:16:38AM -0500, Robert P. J. Day wrote:
> > 
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > 
> > ---
> > 
> >   guessing just a copy and paste error, which currently generates:
> 
> No, the recent change in bitbake to handle multiline comments slightly 
> different, i.e. stricter...

Previously if you put something in place of that blank line uncommented,
bitbake might have ignored it under certain circumstances. This is
rather unexpected by users.

We therefore made bitbake ask the users to say what they mean :)

Its a bit of a short term pain but a win for usability after that.

Cheers,

Richard


