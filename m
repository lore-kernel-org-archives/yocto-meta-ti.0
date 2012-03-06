Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0C21E0132F
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2012 05:35:43 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 5B80FF81274; Tue,  6 Mar 2012 06:35:42 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 50628F81208;
	Tue,  6 Mar 2012 06:35:41 -0700 (MST)
Message-ID: <4F5612AD.5040005@mlbassoc.com>
Date: Tue, 06 Mar 2012 06:35:41 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Enrico <ebutera@users.berlios.de>
References: <4F560422.8050405@mlbassoc.com>
	<CA+2YH7uxmj86FdEbqmbrOD-W1Rii09PRhDjJ8HhoW7t20wSWDg@mail.gmail.com>
In-Reply-To: <CA+2YH7uxmj86FdEbqmbrOD-W1Rii09PRhDjJ8HhoW7t20wSWDg@mail.gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: meta-ti vs meta-texasinstruments
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
X-List-Received-Date: Tue, 06 Mar 2012 13:35:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-06 06:19, Enrico wrote:
> On Tue, Mar 6, 2012 at 1:33 PM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> Why are there two layers, each seemingly providing support for
>> TI products (boards, tools, etc)?  They have a great overlap,
>> but many differences...
>>
>> Shouldn't there only be one such layer?  As is, the meta-texasinstruments
>> one seems to be rather out of date, but I'm not sure.
>
> url of these layers? Maybe it's just an old reference in your setup
> that is not getting updated (previously it was called
> meta-texasinstruments and then it became meta-ti).

Indeed, the meta-texasinstruments one may just be left over chaff.

That said, where is u-boot-fw-utils (assuming not meta-texasinstruments)?
A quick find in angstrom/sources shows
   ./meta-ti/recipes-bsp/u-boot/u-boot_2011.12.bb:RRECOMMENDS_${PN}_beagleboard = "u-boot-fw-utils"
   ./meta-ti/recipes-bsp/u-boot/u-boot_git.bb:RRECOMMENDS_${PN}_omap3-touchbook = "u-boot-fw-utils"

   ./meta-texasinstruments/recipes-bsp/u-boot/u-boot.inc:PACKAGES += "${PN}-fw-utils"
   ./meta-texasinstruments/recipes-bsp/u-boot/u-boot.inc:FILES_${PN}-fw-utils = "${sysconfdir} ${base_sbindir}"

   ./meta-openpandora/recipes-bsp/u-boot/u-boot.inc:PACKAGES += "${PN}-fw-utils"
   ./meta-openpandora/recipes-bsp/u-boot/u-boot.inc:FILES_${PN}-fw-utils = "${sysconfdir} ${base_sbindir}"
   ./meta-openpandora/recipes-bsp/u-boot/u-boot.inc:INSANE_SKIP_${PN}-fw-utils = True

   ./meta-efikamx/recipes-bsp/u-boot/u-boot.inc:PACKAGES += "${PN}-fw-utils"
   ./meta-efikamx/recipes-bsp/u-boot/u-boot.inc:FILES_${PN}-fw-utils = "${sysconfdir} ${base_sbindir}"
   ./meta-efikamx/recipes-bsp/u-boot/u-boot.inc:INSANE_SKIP_${PN}-fw-utils = "1"

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

