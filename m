Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC807E00B37; Tue, 19 Jan 2016 11:13:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAA70E00AAF
	for <meta-ti@yoctoproject.org>; Tue, 19 Jan 2016 11:13:20 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0JJDIG9007595;
	Tue, 19 Jan 2016 13:13:18 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0JJDI2u012934;
	Tue, 19 Jan 2016 13:13:18 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 Jan 2016 13:13:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0JJDHQS002650;
	Tue, 19 Jan 2016 13:13:17 -0600
Date: Tue, 19 Jan 2016 14:13:01 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160119191301.GF4223@edge>
References: <1453218687-30012-1-git-send-email-paul.barker@commagility.com>
	<D9EE8563-6AA4-47D5-9CFE-6638C32B5658@gmail.com>
MIME-Version: 1.0
In-Reply-To: <D9EE8563-6AA4-47D5-9CFE-6638C32B5658@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-softhsmv2: Use target includes for zlib and openssl
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
X-List-Received-Date: Tue, 19 Jan 2016 19:13:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 19, 2016 at 11:01:37AM -0800, Khem Raj wrote:
> 
> > On Jan 19, 2016, at 7:51 AM, Paul Barker <paul.barker@commagility.com> wrote:
> > 
> > ti-softhsmv2 needs to look at the target include directories instead of the host
> > include directories for zlib and openssl header files.
> > 
> > Signed-off-by: Paul Barker <paul.barker@commagility.com>
> > ---
> > recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb | 5 ++++-
> > 1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> > index c1e1654..dd51309 100644
> > --- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> > +++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> > @@ -21,7 +21,10 @@ S = "${WORKDIR}/git"
> > CFLAGS += " -mno-unaligned-access"
> > CPPFLAGS += " -mno-unaligned-access"
> > 
> > -EXTRA_OECONF += "--with-zlib=${STAGING_DIR_HOST}/usr"
> > +EXTRA_OECONF += " \
> > +    --with-zlib=${STAGING_DIR_TARGET}/usr \
> > +    --with-openssl=${STAGING_DIR_TARGET}/usr \
> > +    “
> 
> you know there is STAGING_EXECPREFIXDIR, may be better suited here ?

From bitbake.conf:

STAGING_EXECPREFIXDIR = "${STAGING_DIR_HOST}${exec_prefix}"


> > INITSCRIPT_NAME = "softhsm-daemon.sh"
> > INITSCRIPT_PARAMS = "defaults 10"
> > --
> > 1.9.1
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> 



> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


