Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA458E013CC
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2012 14:13:36 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 095CB52A5F; Tue, 28 Feb 2012 22:13:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120228221336.095CB52A5F@arago-project.org>
Date: Tue, 28 Feb 2012 22:13:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : matrix: remove old Matrix and replace with README to point to new location
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
X-List-Received-Date: Tue, 28 Feb 2012 22:13:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 266d76ba87d9ddf4db96d481bdd42cdd4e01362b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=266d76ba87d9ddf4db96d481bdd42cdd4e01362b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb 28 17:10:55 2012 -0500

matrix: remove old Matrix and replace with README to point to new location

Matrix is now hosted in the meta-arago-extras (sub-)layer of meta-arago. This
sub-layer is not Arago-specific and can be used with any distro. More details
at git://arago-project.org/git/meta-arago.git

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/matrix/README                           |    5 +
 recipes-ti/matrix/matrix-gui-3d-demos_1.0.bb       |   18 -
 recipes-ti/matrix/matrix-gui-apps.inc              |   40 -
 recipes-ti/matrix/matrix-gui-clocks_1.1.bb         |   34 -
 recipes-ti/matrix/matrix-gui-coming-soon_1.0.bb    |   17 -
 recipes-ti/matrix/matrix-gui-common.inc            |   44 -
 recipes-ti/matrix/matrix-gui-common_1.4.bb         |    7 -
 recipes-ti/matrix/matrix-gui-crypto-demos_1.2.bb   |   19 -
 .../matrix/matrix-gui-display-control_1.0.bb       |   21 -
 recipes-ti/matrix/matrix-gui-e.inc                 |   48 -
 recipes-ti/matrix/matrix-gui-e_1.3.bb              |    6 -
 recipes-ti/matrix/matrix-gui-paths.inc             |    3 -
 recipes-ti/matrix/matrix-gui-pm-demos_1.0.bb       |   21 -
 recipes-ti/matrix/matrix-gui-qt4-demos_1.0.bb      |   20 -
 recipes-ti/matrix/matrix-gui-submenus_1.0.bb       |  105 --
 recipes-ti/matrix/matrix-gui-wifi-demos_1.1.bb     |   19 -
 recipes-ti/matrix/matrix-gui.inc                   |   51 -
 recipes-ti/matrix/matrix-gui/init                  |   64 -
 recipes-ti/matrix/matrix-gui/php.ini               | 1342 --------------------
 recipes-ti/matrix/matrix-gui_1.3.bb                |    6 -
 recipes-ti/matrix/matrix-gui_2.0.bb                |   34 -
 recipes-ti/matrix/matrix-lighttpd-config.bb        |   26 -
 .../matrix-lighttpd-config/lighttpd.conf.matrix    |  341 -----
 23 files changed, 5 insertions(+), 2286 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=266d76ba87d9ddf4db96d481bdd42cdd4e01362b

