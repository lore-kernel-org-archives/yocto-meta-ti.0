Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3F82E0030F
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 12:12:59 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QKCxG3029492
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 14:12:59 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QKCx0v029491
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 14:12:59 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Thu, 26 Jan 2012 14:12:59 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCH 0/5] *** SUBJECT HERE ***
Thread-Index: AQHM3GatGoplSR19vk2sywkUctodqJYfFN+Q
Date: Thu, 26 Jan 2012 20:12:59 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BF9A451@DLEE12.ent.ti.com>
References: <1327608676-4790-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1327608676-4790-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] *** SUBJECT HERE ***
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
X-List-Received-Date: Thu, 26 Jan 2012 20:12:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sorry, I'm new to cover letters and it looks like I messed this up a little

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Maupin, Chase
> Sent: Thursday, January 26, 2012 2:11 PM
> To: meta-ti@yoctoproject.org
> Cc: Maupin, Chase
> Subject: [PATCH 0/5] *** SUBJECT HERE ***
>=20
> This patch set replaces the previous patches that were submitted.
> The patches were re-ordered because the dependency between
> applications
> such as arm-benchmarks and the matrix-gui-xxxx packages was
> reworked
> such that we want to patch in the benchmarks first.
>=20
> This was done to bring consistency to how matrix applications were
> added.
>=20
> Chase Maupin (5):
>   arm-benchmarks: port of am-benchmarks from arago
>   am-sysinfo: port to latest version from arago
>   matrix-gui-browser: port from arago overlay
>   refresh-screen: add package from arago
>   matrix-gui: update to latest version
>=20
>  recipes-bsp/ti/am-sysinfo_svn.bb                   |   23 -----
>  recipes-ti/am-sysinfo/am-sysinfo_svn.bb            |   29 ++++++
>  recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb    |   24 +++++
>  recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb       |   18 ----
>  recipes-ti/matrix/matrix-gui-3d-demos_2.0.bb       |   22 ++++
>  recipes-ti/matrix/matrix-gui-apps-git.inc          |   10 ++
>  recipes-ti/matrix/matrix-gui-apps-images_2.0.bb    |   20 ++++
>  .../matrix/matrix-gui-armbenchmarks-demos_2.0.bb   |   17 +++
>  recipes-ti/matrix/matrix-gui-browser_2.0.bb        |   24 +++++
>  .../matrix/matrix-gui-camera-loopback_2.0.bb       |   18 ++++
>  ...-gui-clocks_1.1.bb =3D> matrix-gui-clocks_2.0.bb} |   18 ++--
>  recipes-ti/matrix/matrix-gui-coming-soon_1.0.bb    |   17 ---
>  recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb   |   19 ----
>  recipes-ti/matrix/matrix-gui-crypto-demos_2.0.bb   |   17 +++
>  .../matrix/matrix-gui-display-control_1.0.bb       |   21 ----
>  .../matrix/matrix-gui-display-control_2.0.bb       |   18 ++++
>  .../matrix/matrix-gui-multimedia-demos_2.0.bb      |   17 +++
>  recipes-ti/matrix/matrix-gui-oprofile-demos_2.0.bb |   17 +++
>  recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb       |   21 ----
>  recipes-ti/matrix/matrix-gui-pm-demos_2.0.bb       |   17 +++
>  recipes-ti/matrix/matrix-gui-pru-demos_2.0.bb      |   17 +++
>  recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb      |   20 ----
>  recipes-ti/matrix/matrix-gui-qt4-demos_2.0.bb      |   17 +++
>  recipes-ti/matrix/matrix-gui-settings-demos_2.0.bb |   17 +++
>  recipes-ti/matrix/matrix-gui-submenus_1.0.bb       |  105 --------
> ------------
>  recipes-ti/matrix/matrix-gui-submenus_2.0.bb       |   50
> +++++++++
>  recipes-ti/matrix/matrix-gui-usb-demos_2.0.bb      |   17 +++
>  recipes-ti/matrix/matrix-gui-v4l2-demos_2.0.bb     |   17 +++
>  recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb     |   19 ----
>  recipes-ti/matrix/matrix-gui-wifi-demos_2.0.bb     |   17 +++
>  recipes-ti/matrix/matrix-gui/init                  |   57
> ++++++++---
>  recipes-ti/matrix/matrix-gui_2.0.bb                |   39 ++++++-
>  recipes-ti/matrix/refresh-screen_2.0.bb            |   25 +++++
>  33 files changed, 508 insertions(+), 296 deletions(-)
>  delete mode 100644 recipes-bsp/ti/am-sysinfo_svn.bb
>  create mode 100644 recipes-ti/am-sysinfo/am-sysinfo_svn.bb
>  create mode 100644 recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb
>  delete mode 100644 recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-3d-demos_2.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-apps-git.inc
>  create mode 100644 recipes-ti/matrix/matrix-gui-apps-images_2.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-armbenchmarks-
> demos_2.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-browser_2.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-camera-
> loopback_2.0.bb
>  rename recipes-ti/matrix/{matrix-gui-clocks_1.1.bb =3D> matrix-gui-
> clocks_2.0.bb} (66%)
>  delete mode 100644 recipes-ti/matrix/matrix-gui-coming-soon_1.0.bb
>  delete mode 100644 recipes-ti/matrix/matrix-gui-crypto-
> demos_1.2.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-crypto-
> demos_2.0.bb
>  delete mode 100644 recipes-ti/matrix/matrix-gui-display-
> control_1.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-display-
> control_2.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-multimedia-
> demos_2.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-oprofile-
> demos_2.0.bb
>  delete mode 100644 recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-pm-demos_2.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-pru-demos_2.0.bb
>  delete mode 100644 recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-qt4-demos_2.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-settings-
> demos_2.0.bb
>  delete mode 100644 recipes-ti/matrix/matrix-gui-submenus_1.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-submenus_2.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-usb-demos_2.0.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-v4l2-demos_2.0.bb
>  delete mode 100644 recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb
>  create mode 100644 recipes-ti/matrix/matrix-gui-wifi-demos_2.0.bb
>  create mode 100644 recipes-ti/matrix/refresh-screen_2.0.bb


