Return-Path: <h-fache@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB766E0027E
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 01:07:43 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9B87eVg023276
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 03:07:41 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9B87ejn012806
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 03:07:40 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 11 Oct 2012 03:07:40 -0500
Received: from [137.167.109.3] (unb0919861.emea.dhcp.ti.com [137.167.109.3])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9B87dtc001286	for
	<meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 03:07:40 -0500
Message-ID: <50767E49.7030104@ti.com>
Date: Thu, 11 Oct 2012 10:07:37 +0200
From: =?ISO-8859-1?Q?Herv=E9_Fache?= <h-fache@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20121003 Thunderbird/15.0.1
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<CA+2YH7t7+XWaaf549x7JOkEpksAH6gTsZVdq=7qAZ8CYxmnmOg@mail.gmail.com>
In-Reply-To: <CA+2YH7t7+XWaaf549x7JOkEpksAH6gTsZVdq=7qAZ8CYxmnmOg@mail.gmail.com>
Subject: Re: [PATCH 1/6] linux-omap4: update to ti-ubuntu-3.4-1487.6
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
X-List-Received-Date: Thu, 11 Oct 2012 08:07:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

Ciao Enrico,

Your patches look good so far! I shall share my tree in a bit so we can
help each-other.

On 10/11/2012 01:46 AM, Enrico wrote:
> On Thu, Oct 11, 2012 at 1:40 AM, Enrico Butera <ebutera@users.berlios.de> wrote:
>> Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
>> ---
>>  recipes-kernel/linux/linux-omap4-3.4/defconfig | 4669 ++++++++++++++++++++++++
>>  recipes-kernel/linux/linux-omap4_3.4.bb        |   17 +
>>  2 files changed, 4686 insertions(+)
>>  create mode 100644 recipes-kernel/linux/linux-omap4-3.4/defconfig
>>  create mode 100644 recipes-kernel/linux/linux-omap4_3.4.bb
>>
>> diff --git a/recipes-kernel/linux/linux-omap4-3.4/defconfig b/recipes-kernel/linux/linux-omap4-3.4/defconfig
> Note on the defconfig: i had problems with the default omap4 defconfig
> so i took the config from latest geexbox kernel (based on
> 3.4.something) because i knew it was working.
>
> I updated the defconfig with the newer memory requests for ipu and (unused) dsp.
Note that the configuration we use is derived from Ubuntu and is in
debian.ti-omap4/config/config.common.ubuntu. It creates zillions of
modules (> 2000), so we probably want to reduce it though, but some
options will be necessary for RPMsg and PM.

Regards,
Hervé

