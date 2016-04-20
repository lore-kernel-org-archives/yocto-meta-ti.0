Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F473E00DBB; Wed, 20 Apr 2016 12:35:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0778FE007D2
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 12:35:34 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3KJZXBH001608
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 14:35:33 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3KJZXrd002933
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 14:35:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 Apr 2016 14:35:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3KJZWQC016711;
	Wed, 20 Apr 2016 14:35:33 -0500
Date: Wed, 20 Apr 2016 15:35:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Sobota, Justin" <jsobota@ti.com>
Message-ID: <20160420193517.GD10048@edge>
References: <1461177987-495-1-git-send-email-jsobota@ti.com>
	<5717D1B8.9050709@ti.com>
	<311ECDE3E284F649854AED0B108A0CE13AF528ED@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <311ECDE3E284F649854AED0B108A0CE13AF528ED@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master/fido][PATCH 1/2] ipc-transport: Clean up recipe
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
X-List-Received-Date: Wed, 20 Apr 2016 19:35:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 20, 2016 at 07:30:33PM +0000, Sobota, Justin wrote:
> 
> 
> -----Original Message-----
> From: Stiffler, Jacob 
> Sent: Wednesday, April 20, 2016 3:00 PM
> To: Sobota, Justin; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [master/fido][PATCH 1/2] ipc-transport: Clean up recipe
> 
> 
> 
> On 4/20/2016 2:46 PM, Justin Sobota wrote:
> > Signed-off-by: Justin Sobota <jsobota@ti.com>
> > ---
> >   recipes-ti/ipc/ipc-transport-qmss.inc |    4 +++-
> >   recipes-ti/ipc/ipc-transport-srio.inc |    4 +++-
> >   recipes-ti/ipc/ipc-transport.inc      |   14 ++++++++------
> >   3 files changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc 
> > b/recipes-ti/ipc/ipc-transport-qmss.inc
> > index a5c8dc4..7539ef5 100644
> > --- a/recipes-ti/ipc/ipc-transport-qmss.inc
> > +++ b/recipes-ti/ipc/ipc-transport-qmss.inc
> > @@ -3,7 +3,9 @@ LICENSE = "BSD-3-Clause"
> >   
> >   require ipc-transport.inc
> >   
> > -INC_PR_append = ".0"
> > +PR = "${INC_PR}.1"
> 
> PR should be specified in the recipe file.
> 
> [JS] I'll revert this change and bump to ".1" 
> 
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
> >   
> >   COMPATIBLE_MACHINE = "keystone"
> >   
> > diff --git a/recipes-ti/ipc/ipc-transport-srio.inc 
> > b/recipes-ti/ipc/ipc-transport-srio.inc
> > index 4b5c305..18b94d1 100644
> > --- a/recipes-ti/ipc/ipc-transport-srio.inc
> > +++ b/recipes-ti/ipc/ipc-transport-srio.inc
> > @@ -3,7 +3,9 @@ LICENSE = "BSD-3-Clause"
> >   
> >   require ipc-transport.inc
> >   
> > -INC_PR_append = ".0"
> > +PR = "${INC_PR}.1"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
> 
> Why not keep this in the original location? This appears to be duplicated in these intermediate .inc files.
> 
> [JS] checksum against COPYING.txt only applies to Linux recipes.  RTOS 
> recipe checksum is calculated against RTOS-specific files.  Two options: In 
> current patch, move checksum calculation out of top-level include into 
> individual Linux/RTOS recipes OR keep checksum against COPYING.txt in top 
> level include and override it in RTOS recipes.  Which do you prefer?

Separate LIC_FILES_CHKSUM in .bb recipes is preferred if cannot be shared in .inc


> >   COMPATIBLE_MACHINE = "k2hk-evm"
> >   
> > diff --git a/recipes-ti/ipc/ipc-transport.inc 
> > b/recipes-ti/ipc/ipc-transport.inc
> > index 4ba3670..705dfb4 100644
> > --- a/recipes-ti/ipc/ipc-transport.inc
> > +++ b/recipes-ti/ipc/ipc-transport.inc
> > @@ -1,15 +1,17 @@
> > -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
> > +LICENSE = "BSD-3-Clause"
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> What makes these .inc file machine-specific?
> 
> [JS] I'll back this out.  Doesn't make sense being here.
> 
> >   
> >   IPC_TRANSPORT_GIT_URI = "git://git.ti.com/keystone-linux/ipc-transport.git"
> > -IPC_TRANSPORT_GIT_BRANCH = "master"
> >   IPC_TRANSPORT_GIT_PROTOCOL = "git"
> > +IPC_TRANSPORT_GIT_BRANCH = "master"
> >   
> > -# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.01
> > +# Below commit ID corresponds to "DEV.IPC-TRANSPORT.02.00.00.01"
> >   IPC_TRANSPORT_SRCREV = "88ea336c584ccec4b2c281cd7f75df9dff6d4edf"
> >   
> > -BRANCH="${IPC_TRANSPORT_GIT_BRANCH}"
> > +BRANCH = "${IPC_TRANSPORT_GIT_BRANCH}"
> >   SRC_URI = "${IPC_TRANSPORT_GIT_URI};protocol=${IPC_TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
> > +
> >   SRCREV = "${IPC_TRANSPORT_SRCREV}"
> >   PV = "02.00.00.01"
> > -
> > -INC_PR = "r1"
> > +INC_PR = "r2"
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

