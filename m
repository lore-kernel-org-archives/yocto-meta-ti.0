Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0BEAE00A44; Thu, 22 May 2014 10:36:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from devils.ext.ti.com (unknown [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3738BE00975
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 10:36:08 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4MHa7c2013900
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 12:36:07 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MHa7FT019464
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 12:36:07 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 22 May 2014 12:36:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MHa7eB019386;
	Thu, 22 May 2014 12:36:07 -0500
Date: Thu, 22 May 2014 13:36:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140522173605.GP21819@edge>
References: <1400775376-28129-1-git-send-email-Chase.Maupin@ti.com>
	<1400775376-28129-3-git-send-email-Chase.Maupin@ti.com>
	<20140522161900.GL21819@edge> <20140522165029.GN21819@edge>
	<7D46E86EC0A8354091174257B2FED1015D04CC5E@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D04CC5E@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 3/4] setup-defconfig: allow use of in-kernel config fragments
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
X-List-Received-Date: Thu, 22 May 2014 17:36:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 22, 2014 at 01:16:21PM -0400, Maupin, Chase wrote:
> >-----Original Message-----
> >From: Dmytriyenko, Denys
> >Sent: Thursday, May 22, 2014 11:51 AM
> >To: Maupin, Chase
> >Cc: meta-ti@yoctoproject.org
> >Subject: Re: [meta-ti] [PATCH 3/4] setup-defconfig: allow use of
> >in-kernel config fragments
> >
> >On Thu, May 22, 2014 at 12:19:01PM -0400, Denys Dmytriyenko wrote:
> >> On Thu, May 22, 2014 at 11:16:15AM -0500, Chase Maupin wrote:
> >> > * Allow the use of in-kernel config fragments instead of only
> >> >   pulling config fragments from the OE meta data.  The OE meta
> >> >   data fragments will still take precedence over in tree .cfg
> >> >   files.
> >>
> >> I was thinking to do it differently...
> >
> >Basically, I was thinking of embedding the path in the
> >KERNEL_CONFIG_FRAGMENTS
> >variable, similar to how KERNEL_DEVICETREE used to do it:
> >
> >KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/ipc.cfg
> >${KERNEL_CONFIG_DIR}/non-smp.cfg"
> >
> >This way you could have fragments of the same name and choose
> >which one to
> >use. But the logic in setup-defconfig.inc would be much simpler...
> 
> I also considered this.  I had rejected it because I didn't want to see a 
> bunch of duplicate entries for ${WORKDIR} and ${KERNEL_CONFIG_DIR}.  You are 
> right though that it makes the setup-defconfig simpler.
> 
> Maybe a use case to consider is whether we think we would have fragments in 
> more than 2 locations.  i.e. one in WORKDIR, another in directory x of the 
> kernel, and another in directory y of the kernel.  If we think this would be 
> reasonable to support then your method makes more sense.  What do you think?

Another possible location could be inside a separate git repository. Which I 
was considering initially, as I didn't know where Dan would create it...


> >> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> >> > ---
> >> >  recipes-kernel/linux/setup-defconfig.inc |   36
> >++++++++++++++++++++++++++++--
> >> >  1 file changed, 34 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/recipes-kernel/linux/setup-defconfig.inc
> >b/recipes-kernel/linux/setup-defconfig.inc
> >> > index 4277f26..fbe7e96 100644
> >> > --- a/recipes-kernel/linux/setup-defconfig.inc
> >> > +++ b/recipes-kernel/linux/setup-defconfig.inc
> >> > @@ -2,6 +2,10 @@
> >> >  # kernel version string.  such as the commit id
> >> >  KERNEL_LOCALVERSION ?= ""
> >> >
> >> > +# KERNEL_CONFIG_DIR can be set to specify a subdirectory to
> >search for
> >> > +# kernel configuration fragments
> >> > +KERNEL_CONFIG_DIR ?= ""
> >> > +
> >> >  # Check the defconfig file and see if it points to an in
> >kernel
> >> >  # defconfig that should be used, or if it is a complete
> >config file
> >> >
> >> > @@ -27,10 +31,38 @@ do_configure() {
> >> >          yes '' | oe_runmake oldconfig
> >> >      fi
> >> >
> >> > -    # check for fragments
> >> > +    # Check for kernel config fragments.  First check the
> >files copied from
> >> > +    # the OE meta data since we may want to override kernel
> >config fragments
> >> > +    # in the recipe.  If you don't find the fragment in the
> >OE meta data
> >> > +    # then check the kernel sources.  If you still can't find
> >it then bail
> >> > +    # with an error.
> >> > +    # Check if any config fragments are specified.
> >> >      if [ ! -z "${KERNEL_CONFIG_FRAGMENTS}" ]
> >> >      then
> >> > -        ( cd ${WORKDIR} &&
> >${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config
> >${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
> >> > +        # Variable to hold the assembled list of fragments
> >with absolute paths
> >> > +        configs=""
> >> > +
> >> > +        for f in ${KERNEL_CONFIG_FRAGMENTS}
> >> > +        do
> >> > +            # Check if the config fragment was copied into
> >the WORKDIR from
> >> > +            # the OE meta data
> >> > +            if [ -e "${WORKDIR}/$f" ]
> >> > +            then
> >> > +                echo "Found config in workdir"
> >> > +                configs="$configs ""${WORKDIR}/$f"
> >> > +            # Check if the fragement is in the kernel sources
> >> > +            elif [ -e "${S}/${KERNEL_CONFIG_DIR}/$f" ]
> >> > +            then
> >> > +                echo "Found config in kernel"
> >> > +                configs="$configs
> >""${S}/${KERNEL_CONFIG_DIR}/$f"
> >> > +            else
> >> > +                echo "Could not find kernel config fragment
> >$f"
> >> > +                exit 1
> >> > +            fi
> >> > +        done
> >> > +
> >> > +        # Now that all the fragments are located merge them.
> >> > +        ( cd ${WORKDIR} &&
> >${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config
> >${configs} 1>&2 )
> >> >          yes '' | oe_runmake oldconfig
> >> >      fi
> >> >  }
> >> > --
> >> > 1.7.9.5
> >> >
> >> > --
> >> > _______________________________________________
> >> > meta-ti mailing list
> >> > meta-ti@yoctoproject.org
> >> > https://lists.yoctoproject.org/listinfo/meta-ti
> >> --
> >> _______________________________________________
> >> meta-ti mailing list
> >> meta-ti@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-ti

