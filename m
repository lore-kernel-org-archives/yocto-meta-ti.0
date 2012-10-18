Return-Path: <h-fache@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AE1CE01275
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 09:27:58 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9IGRvaj012804
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 11:27:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9IGRvdr002385
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 11:27:57 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 18 Oct 2012 11:27:57 -0500
Received: from [137.167.109.3] (unb0919861.emea.dhcp.ti.com [137.167.109.3])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9IGRuam014616	for
	<meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 11:27:57 -0500
Message-ID: <50802E0E.9000206@ti.com>
Date: Thu, 18 Oct 2012 18:27:58 +0200
From: =?UTF-8?B?SGVydsOpIEZhY2hl?= <h-fache@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
References: <20121018162306.343A752AB7@arago-project.org>
In-Reply-To: <20121018162306.343A752AB7@arago-project.org>
Subject: =?UTF-8?B?UmU6IEhlcnbDqSBGYWNoZSA6IGxpbnV4LW9tYXA0OiB1cGRhdGUgdG8gMy40IGZyb20gR0xQIDEuNi4gNiByZWxlYXNl?=
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
X-List-Received-Date: Thu, 18 Oct 2012 16:27:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In my tree, I kept the kernel and used Enrico's recent patches for
DCE/GST... Maybe some of them could be merged too?

Regards,
Hervé

On 10/18/2012 06:23 PM, Arago Project git wrote:
> Module: meta-ti
> Branch: master
> Commit: 4f3522a9dc7f04e2f650199d66badb08dad214c6
> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4f3522a9dc7f04e2f650199d66badb08dad214c6
>
> Author: Hervé Fache <h-fache@ti.com>
> Date:   Fri Oct  5 14:57:42 2012 +0200
>
> linux-omap4: update to 3.4 from GLP 1.6.6 release
>
> Used Herve's version as a base with some mods from Enrico and additional fixes
> on top, defconfig is the validated one from GLP release.
>
> Signed-off-by: Hervé Fache <h-fache@ti.com>
> Cc: Enrico Butera <ebutera@users.berlios.de>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>
> ---
>
>  .../linux/linux-omap4-3.4/pandaboard/defconfig     | 4152 ++++++++++++++++++++
>  recipes-kernel/linux/linux-omap4_3.4.bb            |   17 +
>  2 files changed, 4169 insertions(+), 0 deletions(-)
>
> Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=4f3522a9dc7f04e2f650199d66badb08dad214c6
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


