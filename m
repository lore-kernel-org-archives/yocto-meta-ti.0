Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E27DE0043F; Fri, 18 Jul 2014 08:38:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A346E00342
	for <meta-ti@yoctoproject.org>; Fri, 18 Jul 2014 08:37:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6IFbm8F014381;
	Fri, 18 Jul 2014 10:37:48 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IFbmWR018144;
	Fri, 18 Jul 2014 10:37:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 18 Jul 2014 10:37:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IFblvC007227;
	Fri, 18 Jul 2014 10:37:47 -0500
Date: Fri, 18 Jul 2014 11:37:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20140718153747.GF15788@edge>
References: <alpine.LFD.2.11.1407180737270.9890@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1407180737270.9890@localhost>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: curious about libdrm-2.4.41 recipe from meta-ti layer
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
X-List-Received-Date: Fri, 18 Jul 2014 15:38:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 18, 2014 at 07:46:36AM -0400, Robert P. J. Day wrote:
> 
>   i was perusing a number of yocto layers looking for cool examples to
> use in an upcoming class and ran across this oddity in the meta-ti
> layer:
> 
> recipes-graphics/drm/libdrm_2.4.41.bb:
>   FILESEXTRAPATHS_append := ":${COREBASE}/meta/recipes-graphics/drm/libdrm"
> 
>   in all of the layers i've looked at, that is the only example of
> *appending* to FILESEXTRAPATHS i've ever seen, so i thought i'd look
> closer to see what was going on.
> 
>   even though oe-core defines a libdrm recipe file, the meta-ti layer
> doesn't use a bbappend for its version. rather, it explicitly adds the
> libdrm/ directory from oe-core using a reference to ${COREBASE}, then
> adds its own files. that's valid, i guess, it just looks weird and is
> the only time i've ever seen that.
> 
>   i'm also puzzled that the meta-ti recipe sets:
> 
> DEFAULT_PREFERENCE = "-1"
> 
> what's that for?  given that the oe-core layer already defines a
> recipe for libdrm that has a higher version number, why would the
> above line be necessary?
> 
>   just trying to understand the rationale behind this unusual
> construction.

You missed line #11 with custom SRC_URI, which points to a forked and 
modified sources of a very specific version of libdrm for one platform.

That's why it sets COMPATIBLE_MACHINE and DEFAULT_PREFERENCE - it needs to be 
requested specifically and not selected automatically by accident. By default 
we want to use the latest upstream version from oe-core.

And it cannot be made as a bbappend - it provides a different version than 
oe-core. But it reuses GNU_SOURCE_definition.patch from oe-core, hence 
FILESEXTRAPATHS mangling.

Don't ask why it's done with forked git sources instead of patches though - 
not my decision :)

-- 
Denys

