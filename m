Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7EC6E00A44; Thu, 22 May 2014 12:39:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from comal.ext.ti.com (unknown [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52953E00975
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 12:38:58 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4MJcv3W004054
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 14:38:57 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MJcvNI024670
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 14:38:57 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 22 May 2014 14:38:57 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 3/4] setup-defconfig: allow use of in-kernel
	config fragments
Thread-Index: AQHPdd3wHCQk0847DEOXSGSdVPKhuJtM1s1QgABZ5wD//85OIA==
Date: Thu, 22 May 2014 19:38:57 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D050864@DLEE11.ent.ti.com>
References: <1400775376-28129-1-git-send-email-Chase.Maupin@ti.com>
	<1400775376-28129-3-git-send-email-Chase.Maupin@ti.com>
	<20140522161900.GL21819@edge> <20140522165029.GN21819@edge>
	<7D46E86EC0A8354091174257B2FED1015D04CC5E@DLEE11.ent.ti.com>
	<20140522173605.GP21819@edge>
In-Reply-To: <20140522173605.GP21819@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 22 May 2014 19:39:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Thursday, May 22, 2014 12:36 PM
>To: Maupin, Chase
>Cc: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCH 3/4] setup-defconfig: allow use of
>in-kernel config fragments
>
>On Thu, May 22, 2014 at 01:16:21PM -0400, Maupin, Chase wrote:
>> >-----Original Message-----
>> >From: Dmytriyenko, Denys
>> >Sent: Thursday, May 22, 2014 11:51 AM
>> >To: Maupin, Chase
>> >Cc: meta-ti@yoctoproject.org
>> >Subject: Re: [meta-ti] [PATCH 3/4] setup-defconfig: allow use
>of
>> >in-kernel config fragments
>> >
>> >On Thu, May 22, 2014 at 12:19:01PM -0400, Denys Dmytriyenko
>wrote:
>> >> On Thu, May 22, 2014 at 11:16:15AM -0500, Chase Maupin wrote:
>> >> > * Allow the use of in-kernel config fragments instead of
>only
>> >> >   pulling config fragments from the OE meta data.  The OE
>meta
>> >> >   data fragments will still take precedence over in tree
>.cfg
>> >> >   files.
>> >>
>> >> I was thinking to do it differently...
>> >
>> >Basically, I was thinking of embedding the path in the
>> >KERNEL_CONFIG_FRAGMENTS
>> >variable, similar to how KERNEL_DEVICETREE used to do it:
>> >
>> >KERNEL_CONFIG_FRAGMENTS =3D "${WORKDIR}/ipc.cfg
>> >${KERNEL_CONFIG_DIR}/non-smp.cfg"
>> >
>> >This way you could have fragments of the same name and choose
>> >which one to
>> >use. But the logic in setup-defconfig.inc would be much
>simpler...
>>
>> I also considered this.  I had rejected it because I didn't want
>to see a
>> bunch of duplicate entries for ${WORKDIR} and
>${KERNEL_CONFIG_DIR}.  You are
>> right though that it makes the setup-defconfig simpler.
>>
>> Maybe a use case to consider is whether we think we would have
>fragments in
>> more than 2 locations.  i.e. one in WORKDIR, another in
>directory x of the
>> kernel, and another in directory y of the kernel.  If we think
>this would be
>> reasonable to support then your method makes more sense.  What
>do you think?
>
>Another possible location could be inside a separate git
>repository. Which I
>was considering initially, as I didn't know where Dan would create
>it...

So it sounds like it would be better if I let the PATH be in the config fra=
gment name.  I'll rework this and send v2.

>
>
>> >> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> >> > ---
>> >> >  recipes-kernel/linux/setup-defconfig.inc |   36
>> >++++++++++++++++++++++++++++--
>> >> >  1 file changed, 34 insertions(+), 2 deletions(-)
>> >> >
>> >> > diff --git a/recipes-kernel/linux/setup-defconfig.inc
>> >b/recipes-kernel/linux/setup-defconfig.inc
>> >> > index 4277f26..fbe7e96 100644
>> >> > --- a/recipes-kernel/linux/setup-defconfig.inc
>> >> > +++ b/recipes-kernel/linux/setup-defconfig.inc
>> >> > @@ -2,6 +2,10 @@
>> >> >  # kernel version string.  such as the commit id
>> >> >  KERNEL_LOCALVERSION ?=3D ""
>> >> >
>> >> > +# KERNEL_CONFIG_DIR can be set to specify a subdirectory
>to
>> >search for
>> >> > +# kernel configuration fragments
>> >> > +KERNEL_CONFIG_DIR ?=3D ""
>> >> > +
>> >> >  # Check the defconfig file and see if it points to an in
>> >kernel
>> >> >  # defconfig that should be used, or if it is a complete
>> >config file
>> >> >
>> >> > @@ -27,10 +31,38 @@ do_configure() {
>> >> >          yes '' | oe_runmake oldconfig
>> >> >      fi
>> >> >
>> >> > -    # check for fragments
>> >> > +    # Check for kernel config fragments.  First check the
>> >files copied from
>> >> > +    # the OE meta data since we may want to override
>kernel
>> >config fragments
>> >> > +    # in the recipe.  If you don't find the fragment in
>the
>> >OE meta data
>> >> > +    # then check the kernel sources.  If you still can't
>find
>> >it then bail
>> >> > +    # with an error.
>> >> > +    # Check if any config fragments are specified.
>> >> >      if [ ! -z "${KERNEL_CONFIG_FRAGMENTS}" ]
>> >> >      then
>> >> > -        ( cd ${WORKDIR} &&
>> >${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config
>> >${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
>> >> > +        # Variable to hold the assembled list of fragments
>> >with absolute paths
>> >> > +        configs=3D""
>> >> > +
>> >> > +        for f in ${KERNEL_CONFIG_FRAGMENTS}
>> >> > +        do
>> >> > +            # Check if the config fragment was copied into
>> >the WORKDIR from
>> >> > +            # the OE meta data
>> >> > +            if [ -e "${WORKDIR}/$f" ]
>> >> > +            then
>> >> > +                echo "Found config in workdir"
>> >> > +                configs=3D"$configs ""${WORKDIR}/$f"
>> >> > +            # Check if the fragement is in the kernel
>sources
>> >> > +            elif [ -e "${S}/${KERNEL_CONFIG_DIR}/$f" ]
>> >> > +            then
>> >> > +                echo "Found config in kernel"
>> >> > +                configs=3D"$configs
>> >""${S}/${KERNEL_CONFIG_DIR}/$f"
>> >> > +            else
>> >> > +                echo "Could not find kernel config
>fragment
>> >$f"
>> >> > +                exit 1
>> >> > +            fi
>> >> > +        done
>> >> > +
>> >> > +        # Now that all the fragments are located merge
>them.
>> >> > +        ( cd ${WORKDIR} &&
>> >${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config
>> >${configs} 1>&2 )
>> >> >          yes '' | oe_runmake oldconfig
>> >> >      fi
>> >> >  }
>> >> > --
>> >> > 1.7.9.5
>> >> >
>> >> > --
>> >> > _______________________________________________
>> >> > meta-ti mailing list
>> >> > meta-ti@yoctoproject.org
>> >> > https://lists.yoctoproject.org/listinfo/meta-ti
>> >> --
>> >> _______________________________________________
>> >> meta-ti mailing list
>> >> meta-ti@yoctoproject.org
>> >> https://lists.yoctoproject.org/listinfo/meta-ti

