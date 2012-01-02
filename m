Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.23])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 7DE2DE005B4
	for <meta-ti@yoctoproject.org>; Sun,  1 Jan 2012 16:31:34 -0800 (PST)
Received: (qmail invoked by alias); 02 Jan 2012 00:31:32 -0000
Received: from p4FDF0DB6.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.13.182]
	by mail.gmx.net (mp011) with SMTP; 02 Jan 2012 01:31:32 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19I4EkDE/tIvCwo5RZQZFOZpzVjh79TFDNl4OfuqE
	PYpR0yrNg1TMrI
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Mon, 2 Jan 2012 01:32:34 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1325013184-25813-1-git-send-email-bigotp@acm.org>
	<CA+M6bXn4OJPD=xJCo1-WDTJ5DxXN68644Qop4vjanq_M2tf83w@mail.gmail.com>
In-Reply-To: <CA+M6bXn4OJPD=xJCo1-WDTJ5DxXN68644Qop4vjanq_M2tf83w@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201201020132.34526.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] u-boot 2011.12rc1: OMAP MMC: Add delay before waiting for status
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
X-List-Received-Date: Mon, 02 Jan 2012 00:31:35 -0000
X-Groupsio-MsgNum: 317
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_isPAPCF2tAEtxVD"

--Boundary-00=_isPAPCF2tAEtxVD
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday, December 27, 2011 11:32:26 PM Tom Rini wrote:
> On Tue, Dec 27, 2011 at 12:13 PM, Peter A. Bigot <bigotp@acm.org> wrote:
> > From: "Peter A. Bigot" <bigotp@acm.org>
> > 
> > Pending upstream patch from http://patchwork.ozlabs.org/patch/132795/ is
> > required to successfully boot on xM.
> > 
> > Signed-off-by: Peter A. Bigot <bigotp@acm.org>
> 
> I don't see the harm here so:
> 
> Acked-by: Tom Rini <tom.rini@gmail.com>
> 
> But I need to talk with Andreas a bit and see what's going on here as
> I hadn't seen that problem here before.
Some more background on this patch:

For my two overos board revision 2 I got

| reading uImage
| mmc_send_cmd: timedout waiting for stat!
|
| 2860468 bytes read

but the loaded kernel worked without issues. To invesigate, I added a message in 
drivers/mmc/omap_hsmmc.c / mmc_send_cmd():

	while (readl(&mmc_base->stat)) {
		if (get_timer(0) - start > MAX_RETRY_MS) {
			printf("%s: timedout waiting for stat!\n", __func__);
-->			printf("cmd->cmdidx: %u\n", cmd->cmdidx);
			return TIMEOUT;
		}
	}

This lead to

| cmd->cmdidx: 13

which is found in include/mmc.h:

| #define MMC_CMD_SEND_STATUS 13. 

This cmdidx is only set once in drivers/mmc/mmc.c / mmc_send_status(). On all 
calls of mmc_send_status I added (see attachment)

printf("mmc_send_status called from %s\n", __func__);

and got:

| reading uImage
| mmc_send_status called from mmc_read_blocks
| mmc_send_status called from mmc_read_blocks
| mmc_send_status called from mmc_read_blocks
| mmc_send_status called from mmc_read_blocks
| mmc_send_status called from mmc_read_blocks
| mmc_send_status called from mmc_read_blocks
| mmc_send_status called from mmc_read_blocks
| mmc_send_status called from mmc_read_blocks
| mmc_send_status called from mmc_read_blocks
| 
| 3018844 bytes read

This showed me (I recreated this here with a different kernel):
1. In my case mmc_send_status is called only from mmc_read_blocks and < 10 times
2. The error message disappeared!!

So I added the delay as you see in the patch. I started with a delay of 10ms and 
reduced it to minimum of 1us and the error did not occure anymore.

Maybe the problem is depending on the SDcard type? At the moment I cannot tell 
which card type I used because it is at the office. It seems Peter had same 
issues: Which card type do you use?

Happy new year

Andreas

--Boundary-00=_isPAPCF2tAEtxVD
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-test-printf.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-test-printf.patch"

From a439a42b8e2e30d1db0dc85cc6c673b5e9c6f561 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmx.de>
Date: Mon, 2 Jan 2012 01:04:13 +0100
Subject: [PATCH] test printf
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmx.de>
---
 drivers/mmc/mmc.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mmc/mmc.c b/drivers/mmc/mmc.c
index 21665ec..eee32a4 100644
--- a/drivers/mmc/mmc.c
+++ b/drivers/mmc/mmc.c
@@ -307,6 +307,7 @@ mmc_write_blocks(struct mmc *mmc, ulong start, lbaint_t=
 blkcnt, const void*src)
 		}
=20
 		/* Waiting for the ready status */
+		printf("mmc_send_status called from %s\n", __func__);
 		mmc_send_status(mmc, timeout);
 	}
=20
@@ -375,6 +376,7 @@ int mmc_read_blocks(struct mmc *mmc, void *dst, ulong s=
tart, lbaint_t blkcnt)
 		}
=20
 		/* Waiting for the ready status */
+		printf("mmc_send_status called from %s\n", __func__);
 		mmc_send_status(mmc, timeout);
 	}
=20
@@ -610,6 +612,7 @@ int mmc_switch(struct mmc *mmc, u8 set, u8 index, u8 va=
lue)
 	ret =3D mmc_send_cmd(mmc, &cmd, NULL);
=20
 	/* Waiting for the ready status */
+	printf("mmc_send_status called from %s\n", __func__);
 	mmc_send_status(mmc, timeout);
=20
 	return ret;
@@ -918,6 +921,7 @@ int mmc_startup(struct mmc *mmc)
 	err =3D mmc_send_cmd(mmc, &cmd, NULL);
=20
 	/* Waiting for the ready status */
+	printf("mmc_send_status called from %s\n", __func__);
 	mmc_send_status(mmc, timeout);
=20
 	if (err)
--=20
1.7.4.4


--Boundary-00=_isPAPCF2tAEtxVD--
